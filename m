Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC543D74
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 07:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994CEC433C0;
	Thu, 29 Jun 2023 07:03:44 +0000 (UTC)
Message-ID: <567481c3-08bc-3bb8-5538-0d296ee539d9@xs4all.nl>
Date: Thu, 29 Jun 2023 09:03:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] media: verisilicon: fix excessive stack usage
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230616144854.3818934-1-arnd@kernel.org>
 <20230628182617.GA911656@dev-arch.thelio-3990X>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230628182617.GA911656@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 6/28/23 20:26, Nathan Chancellor wrote:
> On Fri, Jun 16, 2023 at 04:48:47PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> In some configurations, gcc decides not to inline the register accessor functions,
>> which in turn leads to lots of temporary hantro_reg structures on the stack that
>> cannot be eliminated because they escape into an uninlined function:
>>
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1022:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>
>> Mark all of these as __always_inline so the compiler is able to completely
>> eliminate the temporary structures instead, which brings the stack usage
>> back down to just the normal local variables.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202306151506.goHEegOd-lkp@intel.com/
>> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> For what it's worth, this patch massively helps with avoiding a warning
> with clang 16.x and older, for presumably a similar reason, since this
> happens with allmodconfig, which turns on a bunch of sanitizers.
> 
> https://github.com/ClangBuiltLinux/linux/issues/1875
> 
> Before this change:
> 
>    drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:2097:5: error: stack frame size (2096) exceeds limit (2048) in 'rockchip_vpu981_av1_dec_run' [-Werror,-Wframe-larger-than]
>    int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>        ^
>    238/2096 (11.35%) spills, 1858/2096 (88.65%) variables
> 
> After this change:
> 
>    drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:2097:5: error: stack frame size (496) exceeds limit (200) in 'rockchip_vpu981_av1_dec_run' [-Werror,-Wframe-larger-than]
>    int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>        ^
>    265/496 (53.43%) spills, 231/496 (46.57%) variables
> 
> If this could be picked up either before the 6.5 media pull goes out or
> at some point during the -rc cycle, that would be great!

Once the merge window closes I'll make a PR to get it in 6.5.

Regards,

	Hans

> 
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
>> ---
>>   drivers/media/platform/verisilicon/hantro.h | 22 ++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
>> index 6523ffb748812..6c5e56ce5b351 100644
>> --- a/drivers/media/platform/verisilicon/hantro.h
>> +++ b/drivers/media/platform/verisilicon/hantro.h
>> @@ -370,26 +370,26 @@ extern int hantro_debug;
>>   	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
>>   
>>   /* Structure access helpers. */
>> -static inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
>> +static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
>>   {
>>   	return container_of(fh, struct hantro_ctx, fh);
>>   }
>>   
>>   /* Register accessors. */
>> -static inline void vepu_write_relaxed(struct hantro_dev *vpu,
>> +static __always_inline void vepu_write_relaxed(struct hantro_dev *vpu,
>>   				      u32 val, u32 reg)
>>   {
>>   	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
>>   	writel_relaxed(val, vpu->enc_base + reg);
>>   }
>>   
>> -static inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
>> +static __always_inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
>>   {
>>   	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
>>   	writel(val, vpu->enc_base + reg);
>>   }
>>   
>> -static inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
>> +static __always_inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
>>   {
>>   	u32 val = readl(vpu->enc_base + reg);
>>   
>> @@ -397,27 +397,27 @@ static inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
>>   	return val;
>>   }
>>   
>> -static inline void vdpu_write_relaxed(struct hantro_dev *vpu,
>> +static __always_inline void vdpu_write_relaxed(struct hantro_dev *vpu,
>>   				      u32 val, u32 reg)
>>   {
>>   	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
>>   	writel_relaxed(val, vpu->dec_base + reg);
>>   }
>>   
>> -static inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
>> +static __always_inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
>>   {
>>   	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
>>   	writel(val, vpu->dec_base + reg);
>>   }
>>   
>> -static inline void hantro_write_addr(struct hantro_dev *vpu,
>> +static __always_inline void hantro_write_addr(struct hantro_dev *vpu,
>>   				     unsigned long offset,
>>   				     dma_addr_t addr)
>>   {
>>   	vdpu_write(vpu, addr & 0xffffffff, offset);
>>   }
>>   
>> -static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
>> +static __always_inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
>>   {
>>   	u32 val = readl(vpu->dec_base + reg);
>>   
>> @@ -425,7 +425,7 @@ static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
>>   	return val;
>>   }
>>   
>> -static inline u32 vdpu_read_mask(struct hantro_dev *vpu,
>> +static __always_inline u32 vdpu_read_mask(struct hantro_dev *vpu,
>>   				 const struct hantro_reg *reg,
>>   				 u32 val)
>>   {
>> @@ -437,14 +437,14 @@ static inline u32 vdpu_read_mask(struct hantro_dev *vpu,
>>   	return v;
>>   }
>>   
>> -static inline void hantro_reg_write(struct hantro_dev *vpu,
>> +static __always_inline void hantro_reg_write(struct hantro_dev *vpu,
>>   				    const struct hantro_reg *reg,
>>   				    u32 val)
>>   {
>>   	vdpu_write_relaxed(vpu, vdpu_read_mask(vpu, reg, val), reg->base);
>>   }
>>   
>> -static inline void hantro_reg_write_s(struct hantro_dev *vpu,
>> +static __always_inline void hantro_reg_write_s(struct hantro_dev *vpu,
>>   				      const struct hantro_reg *reg,
>>   				      u32 val)
>>   {
>> -- 
>> 2.39.2
>>
