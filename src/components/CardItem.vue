<template>
    <div 
        class='Card' v-bind:class="{ inactive: !product.isActive }"
        @click="this.$emit('clickOnCard', product.id)"
    >
            <p>{{ product.title }}</p>
            <MyButton @click="this.$emit('removeCard', product.id)">Удалить</MyButton>
    </div>
</template>

<script>
    import MyButton from '@/components/MyButton.vue'
    export default {
        components: {MyButton},
        props: {
            product: {
                type: Object
            }
        }
    }
    
</script>

<style>
    .Card {
        display: flex;
        width: 100%;
        border-radius: 3px;
        background: #F3F3F3;
        /* box-shadow: 0px 0px 14px 0px rgba(8, 19, 120, 0.10); */
        cursor: pointer;
        padding: 20px 30px;
        align-items: center;
        justify-content: space-between;
    }
    .Card p {
        margin: 0;
    }
    .Card:hover {
        box-shadow: 0px 0px 14px 0px rgba(8, 19, 120, 0.50);
    }
    .inactive p {
        opacity: 0.5;
        text-decoration: line-through;
    }
</style>