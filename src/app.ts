import express,{Request, Response} from "express"; 
import { router } from "./routes/route";
import  mongoose  from "mongoose";
import dotenv from "dotenv";


dotenv.config();
const app = express();
app.use(express.urlencoded({extended : false}));
app.use(express.json());
mongoose.connect(
    process.env.MONGODB_URL as string,
    {
        useUnifiedTopology: true,
        useNewUrlParser : true,
    },
    ()=>{
        console.log("DB Connected")
    }
);


app.use("/", router);
app.get("/vaada", (req,res) => {
	res.json({
		hi:'hi'
	})
})


app.listen(8080, ()=>{
    console.log("Shit is rocking at lh 8080")
});
