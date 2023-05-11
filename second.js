
const loadedImage1= true
const loadedImage2=false




//const video2Recorded=false
function Image1(){
    return new Promise((resolve,reject)=>{
        if(loadedImage1){
            resolve('Image 1 loaded')
        }else {
            reject ( 'Image 1 failed to load')
        }
    })

}function Image2(){
    return new Promise((resolve,reject)=>{
        if(loadedImage2){
            resolve(
                'Image 2 loaded')
        }else {
            reject ( 'Image 2 failed to load')
        }
    })

}

async function LoadingImages(){
    try{
    const image1 =await Image1()
    console.log('IMAGE 1 LOADED')
    const image2 = await Image2()
    console.log('IMAGE 2 LOADED')}
    catch(err){
        console.log(err)
    }
}

LoadingImages()

    


