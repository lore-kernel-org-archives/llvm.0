Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C134C9AF;
	Fri,  8 May 2026 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263373; cv=none; b=BVqUka0VRIGk428iui/sY9TZjbyjqvSEbrDDYbJXp7MpbCw5UfI5UJoPYTbMxf3esees7iieow7szEgstuGSvRK4CJhfJHDGSwyjgfxJTeIZYzqsozVjFp/5FvBHcMMwPEXXQf6d1hXvktluFLCRdmUperKfWxQtu6jrwQ6Vw0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263373; c=relaxed/simple;
	bh=AKvWWRPw/D8Xckpj+mstm3b0KLumbTizI8ZsmiXPrcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAO7zeu2Ligi65xf6hqEeZxBj19UcJVv51BU/550wrwOi4OrunUeHJ37kxTczsCeju7SSlTqYbgbU4Ya0TRAw4o/Byx7t9OutXDxHdl1ITatCfbBNCsNJH/RfswM55ifLLx+h6wov8Pn5azeFKBMo7FLJ6HfN4Ej/Cm/NxzS3qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=24Kjxg6s; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="24Kjxg6s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VU+sD5LsGgKlT7WK1t2kvTaURoqtS+jV65CI0LAKuTw=; b=24Kjxg6sf5lLyCSfEVMTuoCdWq
	hhQ6eLVVLBVUxqAp/UQu3XOQ+yqrh1ByN9rrSFqhVNqsYecffR6fAMf8Hf6POWKBEH9KPhG/6mQcm
	eXF0FCdZa+nbyawU4WyDrZ0WIxD28F9E+7Jem+fCSJgWaM8r7/KuKugK4qodynywxhIOP8tXZwj4o
	5La4BRGjXRgywXN6W03yNsAJWYBpzqTHpvDHYT9o+P3P+3oj87FzjxnlDgeXbdieW52KH6G+oJc9Q
	b5QOqLxz7Qjlf1018v1k/GFcxaHnzdbrWaD25Ia2KpJcPXLPpMX+eTJZ6GHZfLyToxLas2i0FiPEf
	KaAGzH5A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXF-00000007DjV-4Axq;
	Fri, 08 May 2026 18:02:50 +0000
Message-ID: <652a2af6-739d-4cd1-a72f-9505c3720fc7@infradead.org>
Date: Fri, 8 May 2026 11:02:49 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] soc: ti: knav_qmss: Fix kernel-doc Return: tags
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-5-nm@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260508153211.3688277-5-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/26 8:32 AM, Nishanth Menon wrote:
> Fix functions that use inline 'Returns ...' instead of 'Return:'
> kernel-doc comments, producing warnings with W=2:
> 
>   knav_qmss_queue.c:524: No description found for return value
>   of 'knav_queue_open'
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Cc: Randy Dunlap <rdunlap@infradead.org>
> 
>  drivers/soc/ti/knav_qmss_queue.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index f65658014b05..c3f85052002b 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -517,7 +517,7 @@ static int knav_queue_flush(struct knav_queue *qh)
>   *			     Subsequent attempts to open a shared queue should
>   *			     also have this flag.
>   *
> - * Returns a handle to the open hardware queue if successful. Use IS_ERR()
> + * Return: handle to the open hardware queue on success. Use IS_ERR()
>   * to check the returned value for error codes.
>   */
>  void *knav_queue_open(const char *name, unsigned id,
> @@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(knav_queue_close);
>   * @cmd:			- control commands
>   * @arg:			- command argument
>   *
> - * Returns 0 on success, errno otherwise.
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_queue_device_control(void *qhandle, enum knav_queue_ctrl_cmd cmd,
>  				unsigned long arg)
> @@ -625,7 +625,7 @@ EXPORT_SYMBOL_GPL(knav_queue_device_control);
>   * @size:		- size of data to push
>   * @flags:		- can be used to pass additional information
>   *
> - * Returns 0 on success, errno otherwise.
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_queue_push(void *qhandle, dma_addr_t dma,
>  					unsigned size, unsigned flags)
> @@ -646,7 +646,7 @@ EXPORT_SYMBOL_GPL(knav_queue_push);
>   * @qhandle:		- hardware queue handle
>   * @size:		- (optional) size of the data pop'ed.
>   *
> - * Returns a DMA address on success, 0 on failure.
> + * Return: DMA address on success, 0 on failure.
>   */
>  dma_addr_t knav_queue_pop(void *qhandle, unsigned *size)
>  {
> @@ -747,8 +747,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_dma_to_virt);
>   * @region_id:		- QMSS region id from which the descriptors are to be
>   *			  allocated.
>   *
> - * Returns a pool handle on success.
> - * Use IS_ERR_OR_NULL() to identify error values on return.
> + * Return: pool handle on success. Use IS_ERR_OR_NULL() to identify
> + * error values on return.
>   */
>  void *knav_pool_create(const char *name,
>  					int num_desc, int region_id)
> @@ -878,7 +878,7 @@ EXPORT_SYMBOL_GPL(knav_pool_destroy);
>   * knav_pool_desc_get()	- Get a descriptor from the pool
>   * @ph:		- pool handle
>   *
> - * Returns descriptor from the pool.
> + * Return: descriptor from the pool on success, error pointer otherwise.
>   */
>  void *knav_pool_desc_get(void *ph)
>  {
> @@ -917,7 +917,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_put);
>   * @dma:			- DMA address return pointer
>   * @dma_sz:			- adjusted return pointer
>   *
> - * Returns 0 on success, errno otherwise.
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_pool_desc_map(void *ph, void *desc, unsigned size,
>  					dma_addr_t *dma, unsigned *dma_sz)
> @@ -942,7 +942,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_map);
>   * @dma:			- DMA address of descriptor to unmap
>   * @dma_sz:			- size of descriptor to unmap
>   *
> - * Returns descriptor address on success, Use IS_ERR_OR_NULL() to identify
> + * Return: descriptor address on success. Use IS_ERR_OR_NULL() to identify
>   * error values on return.
>   */
>  void *knav_pool_desc_unmap(void *ph, dma_addr_t dma, unsigned dma_sz)
> @@ -962,7 +962,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_unmap);
>  /**
>   * knav_pool_count()	- Get the number of descriptors in pool.
>   * @ph:			- pool handle
> - * Returns number of elements in the pool.
> + *
> + * Return: number of elements in the pool.
>   */
>  int knav_pool_count(void *ph)
>  {

-- 
~Randy
