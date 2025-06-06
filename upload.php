
<div style="margin: 0 auto;margin-top: 100px; width: 500px;text-align: center;">
    <form action="" method="post"
          enctype="multipart/form-data">
        <label for="file">Filename:</label>
        <input type="file" name="file" id="file" />
        <input type="submit" name="submit" class="btn btn-primary"  value="点我上传" /></br></br>
        只允许上传jpg
    </form>
    <br/>
<?php
    $type = array("jpg");
    if(isset($_FILES['file'])){
        $fileext = end(explode('.', $_FILES['file']['name']));
        if(!in_array($fileext,$type)){
            echo "<script>alert('你上传的不是jpg')</script>";
            exit();
        }else{
            #/app/upload/pic_xxxx.jpg
            $uploadpath = 'upload/';
            $filename = 'pic_' . md5(time()) . '.' . $fileext;
            $uploadfile = $uploadpath . $filename;
            move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
            echo  'upload success.';
			
        }
    }else{
        exit();
    }
    
?>
</div>
