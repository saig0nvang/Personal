# Phân tích Phân khúc Khách hàng với Mô hình RFM (Customer Segmentation with RFM)

Dự án này thực hiện phân tích và phân khúc khách hàng bằng mô hình RFM (Recency, Frequency, Monetary). Mục tiêu là để hiểu rõ hơn các nhóm hành vi của khách hàng, từ đó giúp doanh nghiệp đưa ra các chiến lược tiếp thị được cá nhân hóa, tối ưu hóa chi phí và nâng cao sự hài lòng của khách hàng.

---

### 🎯 Mục tiêu kinh doanh

Customer 360 là một hệ thống phân tích thông tin khách hàng, cho phép công ty khai thác nhiều khía cạnh để phục vụ công việc kinh doanh[cite: 48]. Bằng cách áp dụng mô hình RFM, dự án này hướng tới:
**Xác định các nhóm khách hàng cốt lõi:** Phân loại khách hàng thành các nhóm riêng biệt như "Champions," "Potential Loyalists," "At Risk," v.v.
**Tối ưu hóa chiến dịch Marketing:** Tăng hiệu quả của các chiến dịch bằng cách nhắm mục tiêu vào đúng nhóm khách hàng với những thông điệp phù hợp.
**Cải thiện tỷ lệ giữ chân khách hàng:** Đưa ra các chiến lược phù hợp để giữ chân những khách hàng có giá trị và tái tương tác với những người có nguy cơ rời đi.

---

### 🛠️ Quy trình kỹ thuật

Quá trình phân tích được thực hiện hoàn toàn bằng SQL, bao gồm các bước chính sau:

#### 1. Tính toán các giá trị RFM
Một bảng chi tiết được tạo ra để tính toán ba chỉ số cốt lõi cho mỗi khách hàng:
**Recency (R):** Tính bằng số ngày kể từ lần mua hàng cuối cùng của khách hàng cho đến ngày phân tích (ví dụ: '2022-09-01').

**Frequency (F):** Tần suất mua hàng, được chuẩn hóa theo "tuổi" của khách hàng (thời gian kể từ ngày đăng ký) để đảm bảo sự công bằng giữa khách hàng mới và cũ.

**Monetary (M):** Tổng giá trị chi tiêu (GMV), cũng được chuẩn hóa theo "tuổi" của khách hàng.
 

#### 2. Chấm điểm RFM (Scoring)
Khách hàng được chấm điểm từ 1 đến 5 cho mỗi chỉ số dựa trên phương pháp **ngũ phân vị (Quintile)**.
* Điểm **Recency** càng cao nếu khách hàng mua hàng càng gần đây.
* Điểm **Frequency** và **Monetary** càng cao nếu tần suất và chi tiêu càng lớn.


#### 3. Phân khúc khách hàng (Segmentation)
Các điểm R, F, M riêng lẻ được kết hợp thành một điểm RFM tổng hợp, sau đó được ánh xạ tới các phân khúc khách hàng đã được định nghĩa trước thông qua câu lệnh `CASE`, ví dụ:
*RFM Score = 555` -> **Champions** 
*RFM Score = 451` -> **Potential Loyalist** 
*RFM Score = 112` -> **Lost customers** 

---

### 📊 Trực quan hóa và Phân tích:

*Dữ liệu sau khi được phân khúc bằng SQL được trực quan hóa sử dụng Power BI để rút ra các insight.*


---
