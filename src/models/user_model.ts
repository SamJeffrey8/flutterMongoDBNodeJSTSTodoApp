import mongoose from 'mongoose';

interface TodoI{
    title : string;
    description : string;
}

interface TodoDocument extends mongoose.Document{
    title : string;
    description: string;
}

const todoSchema  =  new mongoose.Schema({
    title : {
        type : String,
        required : true,
    },
    description : {
        type : String,
        required : false,
    },
});

interface totoModelInterFace extends mongoose.Model<TodoDocument>{
    
    set(x : TodoI) : TodoDocument;
    
}



todoSchema.statics.set = ( x  : TodoI) => {
        return new Todo();
    };

const Todo = mongoose.model<TodoDocument, totoModelInterFace> (
    "Todo",
    todoSchema
);

Todo.set({
    title : "NotAvailable", 
    description: "notAvailable",
});

export {Todo};