<template>
  <h1>Список продуктов</h1>
  <div class="inputBlock">
    <input 
      type="text" 
      placeholder="Добавить продукт" 
      v-on:keyup.enter="addProduct"
      :value="inputValue" 
      @input="inputValue = $event.target.value">
    <MyButton @click="addProduct">Добавить</MyButton>
  </div>
  <div v-if="products.length > 0" class="cardsCollection">
    <CardtItem 
    v-for="product in products" 
    :product="product" 
    :key="product.id"
    @clickOnCard="switchProductActive"
    @removeCard="removeCard"
    />
  </div>
  <p v-else>Добавьте в свой список продукты!</p>
</template>

<script>
  import CardtItem from '@/components/CardItem.vue'
  import MyButton from '@/components/MyButton.vue'

  export default {
    name: 'App',
    components: {CardtItem, MyButton},
    data() {
      return {
        inputValue: '',
        products: []
      }
    },
    methods: {
      addProduct() {
        if (this.inputValue.length > 0) {
          this.products.unshift({id: Date.now(), title: this.inputValue, isActive: true})
          this.inputValue=''
        }
      },
      switchProductActive(producId) {
        const products = [...this.products]
        const product = products.find( e => e.id === producId)

        product.isActive = !product.isActive
        products.splice(products.indexOf(product), 1)

        if (!product.isActive) {
          this.products = [...products, product]
        } else {
          this.products = [product, ...products]
        }
      },
      removeCard(producId) {
        const product = this.products.find( e => e.id === producId)
        this.products.splice(this.products.indexOf(product), 1)
      }
    },
    mounted() {
      const data = JSON.parse(localStorage.getItem('ListOfProductsData'))
      if (data) {
        this.products = data
      }
    },  
    watch: {
      products: {
        handler(newVal) {
          localStorage.setItem('ListOfProductsData', JSON.stringify(newVal))
        },
        deep: true
      }
    }
  }
</script>

<style>
  body {
    background-color: #F3F3F3;
    font-family: sans-serif;
  }
  #app {
    height: 100%;
    width: calc(100% - 50px);
    max-width: 1130px;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 50px auto 80px;
    padding: 22px 25px;
    background-color: white;
    border-radius: 5px;
  }
  h1 {
    font-size: 26px;
    font-weight: bold;
  }
  .inputBlock {
    display: flex;
    width: 100%;
    margin-bottom: 50px;
  }
  .inputBlock .Button {
    margin-left: 20px;
  }
  input {
    width: 100%;
    height: 35px;
  }
  .cardsCollection {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    row-gap: 10px;
    margin-bottom: 30px;
  }
</style>
