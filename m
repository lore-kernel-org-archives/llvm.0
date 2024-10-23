Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E805A1D07AA
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729710396; cv=none; b=okQMgEIKzoKUDQgPHk2KoC8GhmSvfrheLaDni87IxyrAXKB69ISapqDhp9fvN9KrRRAd6iC/h3XXPWM+qeYlNvI4Kguf1wPtIRbQ5cDn1iUV/CAthxMy4mPbUF5US6TEBxBbSr5X1hhrBDWHuCxIhv8fQvAIQUxguh+jIMaC8mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729710396; c=relaxed/simple;
	bh=MUjXJs+/5j6AIxCnrN43MvtaAdREM3hXFF1DGIeP6cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqinV40XnTVKXe+cFymPU+XnakD0BiiIo/DWctCCgy2b+JpEXRSsdj98TuqoaxKKYhRTWm+RMfJ+pIoszQnP+TlZwJhsvLGxxcoTyaiJpX2cNTx+Pw3sMnSxQBHs9cUyBF9nBceTikmqRS7sC5pM5cn6ThUqn+1W3uiSfvNTA1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3g2TClp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3g2TClp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso1206425e9.0
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729710393; x=1730315193; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mt+CJGtCAkp6eiODYA4npmvHo9sCXwiECz3QwJrccDE=;
        b=x3g2TClpzJCF1XcFtydCBUvZTaHts3jR3OSK/QBqNRn2z5c+hw4J5ds/BJm7XFPQyw
         c4HrMkysIDi9cUOE1ZBo2yvcVWZuQpIIRzOQkDkfakPdBF8lVRmpWf3vsI9TkaTsfYkv
         dEHsc/88BACgA0SNDyNSra2WeHYw3mT8c9IF7EFywNj/jckekdmx/jiC4B0OOvFH547A
         ISW8eM5rJigjTRNiu1o6JzUwLAmsWsCERj4/UwL1eaz8ftGc/BgJCqCbgeZc637OCEoM
         9r5iAr6bJSzl29rM43Qvh/pPegqLCLSq8UHltYsSQKYIeRDIgnJJK6Nmivxko6WsAKVH
         fMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710393; x=1730315193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt+CJGtCAkp6eiODYA4npmvHo9sCXwiECz3QwJrccDE=;
        b=cAMTh5dwU+8+o0orioPCbfW/KQ/v9uPf5X89ygtS5OYnD98TDq2nlgDMmkWJzwPPj5
         +bGHii7Ncy3RGJ1IiXyJRw3TLnBTbfxiSHkas5X3oZ2QMaLSVmQrl2imjG1UcM8Br8pz
         JB3UvdAxV6nmNeA8iDRIsXKBFzM4lJM1aiVBtCve9a6lVbxP1KVzLShQ1TqhWwB1Zpqj
         dcBKiHAX52kAin8FPOcL4M4e1pt1Wcktp0sUmyGfSryR6UK+guTufnrJvbnN58zeKPuM
         bXHjsQ8uA2jdFn3x/iWn4nYOYpz+Kn+yJ9aO7lidrZ82OFCDPN0hLQeR2jEMxVNNrRhm
         cQeg==
X-Gm-Message-State: AOJu0YyGB5e8Jakbnag6OrIj392/vMPKzctlLxpvuuV7GatWKfKJSyMd
	LdEJr08EmZcLuAZ+RpAYfC8vMhbFqqAmKZqqe8SiUHxitobEsDjoSx2PRIXCT6M=
X-Google-Smtp-Source: AGHT+IEUCTGcY6J3w6fT0tVNF8+m5oQ1FaqoLsRpuLl6MbRK2QUp+EiaZCG+R5ish3CkrJyAlYf6uw==
X-Received: by 2002:a05:600c:3489:b0:42c:af2a:dcf4 with SMTP id 5b1f17b1804b1-43184198c60mr25755445e9.27.1729710393151;
        Wed, 23 Oct 2024 12:06:33 -0700 (PDT)
Received: from localhost ([41.210.146.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c508ddsm23952995e9.40.2024.10.23.12.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:06:32 -0700 (PDT)
Date: Wed, 23 Oct 2024 22:06:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Anders Roxell <anders.roxell@linaro.org>, kobak@nvidia.com,
	"rafael.j.wysocki" <rafael.j.wysocki@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, rui.zhang@intel.com,
	mochs@nvidia.com, Nathan Chancellor <nathan@kernel.org>
Subject: Re: drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned
 argument to 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in
 an unaligned pointer access [-Werror,-Walign-mismatch]
Message-ID: <b153383c-797c-42f6-801d-a6dcc7bfc4f7@stanley.mountain>
References: <CA+G9fYuVefYJx9JsVx1Wz5pV1jKCp9eCPtwZD+FVhdk841q1Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuVefYJx9JsVx1Wz5pV1jKCp9eCPtwZD+FVhdk841q1Zw@mail.gmail.com>

> Config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIm4ZOkWenPJ71UOZG57R0jXE/config

> drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to
> 4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
> unaligned pointer access [-Werror,-Walign-mismatch]
>   156 |                         (void *)efi_pa_va_lookup(&th->guid,
> handler_info->handler_address);
>       |                                                  ^

The problem is that efi_guid_t is alighned but guid_t is not.  I would have
thought that Clang would say that even though the alignment in for &th->guid
isn't spelled out explicitly, it would still end up being aligned at 8 bytes.

typedef guid_t efi_guid_t __aligned(__alignof__(u32));

The relevant code looks like this:

include/linux/uuid.h
    13  #define UUID_SIZE 16
    14  
    15  typedef struct {
    16          __u8 b[UUID_SIZE];
    17  } guid_t;

drivers/acpi/prmt.c
    54  struct prm_handler_info {
    55          guid_t guid;
    56          efi_status_t (__efiapi *handler_addr)(u64, void *);
    57          u64 static_data_buffer_addr;
    58          u64 acpi_param_buffer_addr;
    59  
    60          struct list_head handler_list;
    61  };
    62  
    63  struct prm_module_info {
    64          guid_t guid;
    65          u16 major_rev;
    66          u16 minor_rev;
    67          u16 handler_count;
    68          struct prm_mmio_info *mmio_info;
    69          bool updatable;
    70  
    71          struct list_head module_list;
    72          struct prm_handler_info handlers[] __counted_by(handler_count);
                                        ^^^^^^^^^^
This is a 64bit config so it's 8 byte aligned, right?

    73  };

[ snip ]

drivers/acpi/prmt.c
    96  static int __init
    97  acpi_parse_prmt(union acpi_subtable_headers *header, const unsigned long end)
    98  {
    99          struct acpi_prmt_module_info *module_info;
   100          struct acpi_prmt_handler_info *handler_info;
   101          struct prm_handler_info *th;
   102          struct prm_module_info *tm;
   103          u64 *mmio_count;
   104          u64 cur_handler = 0;
   105          u32 module_info_size = 0;
   106          u64 mmio_range_size = 0;
   107          void *temp_mmio;
   108  
   109          module_info = (struct acpi_prmt_module_info *) header;
   110          module_info_size = struct_size(tm, handlers, module_info->handler_info_count);
   111          tm = kmalloc(module_info_size, GFP_KERNEL);
   112          if (!tm)
   113                  goto parse_prmt_out1;
   114  
   115          guid_copy(&tm->guid, (guid_t *) module_info->module_guid);
   116          tm->major_rev = module_info->major_rev;
   117          tm->minor_rev = module_info->minor_rev;
   118          tm->handler_count = module_info->handler_info_count;
   119          tm->updatable = true;
   120  
   121          if (module_info->mmio_list_pointer) {
   122                  /*
   123                   * Each module is associated with a list of addr
   124                   * ranges that it can use during the service
   125                   */
   126                  mmio_count = (u64 *) memremap(module_info->mmio_list_pointer, 8, MEMREMAP_WB);
   127                  if (!mmio_count)
   128                          goto parse_prmt_out2;
   129  
   130                  mmio_range_size = struct_size(tm->mmio_info, addr_ranges, *mmio_count);
   131                  tm->mmio_info = kmalloc(mmio_range_size, GFP_KERNEL);
   132                  if (!tm->mmio_info)
   133                          goto parse_prmt_out3;
   134  
   135                  temp_mmio = memremap(module_info->mmio_list_pointer, mmio_range_size, MEMREMAP_WB);
   136                  if (!temp_mmio)
   137                          goto parse_prmt_out4;
   138                  memmove(tm->mmio_info, temp_mmio, mmio_range_size);
   139          } else {
   140                  tm->mmio_info = kmalloc(sizeof(*tm->mmio_info), GFP_KERNEL);
   141                  if (!tm->mmio_info)
   142                          goto parse_prmt_out2;
   143  
   144                  tm->mmio_info->mmio_count = 0;
   145          }
   146  
   147          INIT_LIST_HEAD(&tm->module_list);
   148          list_add(&tm->module_list, &prm_module_list);
   149  
   150          handler_info = get_first_handler(module_info);
   151          do {
   152                  th = &tm->handlers[cur_handler];
   153  
   154                  guid_copy(&th->guid, (guid_t *)handler_info->handler_guid);
   155                  th->handler_addr =
   156                          (void *)efi_pa_va_lookup(&th->guid, handler_info->handler_address);
                                                         ^^^^^^^^^
Here is the warning/build error.

   157  
   158                  th->static_data_buffer_addr =
   159                          efi_pa_va_lookup(&th->guid, handler_info->static_data_buffer_address);
   160  

regards,
dan carpenter

