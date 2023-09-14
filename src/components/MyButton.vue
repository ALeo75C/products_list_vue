<template>
    <div 
        class='Button' @click="this.$emit('handleClick')"
    >
        <slot></slot>
</div>
</template>

<script>

</script>

<style>
    .Button {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 3px 20px;
        text-wrap: nowrap;
        height: 34px;
        border-radius: 3px;
        background-color: #081378;
        color: #F3F3F3;
        font-weight: normal;
        font-size: 13px;
        cursor: pointer;
    }
    .Button:hover {
        box-shadow: 1px 1px 5px rgba(1,1,1,0.5);
    }
</style>