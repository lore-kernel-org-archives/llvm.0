Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEBE7E9
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 08:25:20 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id u18so3953120plb.3
        for <llvm@lists.linux.dev>; Thu, 02 Jun 2022 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oRhnzCWuKPecicMPuwgDWmM/IRUGzVdqDQ7z87LQhbk=;
        b=IcVGagBvGn+NYxuFsRi/WEvN4rKiNa1PdLLhSog90tAfXeFzYHZJnMnp+5WKUfu8SY
         gw3Jkn0eRI50CNLBLEMlKvl5Vj8xP/4RTsMjKv79zUpM0DQxFOkMveY1CJlU3gN6lYmp
         SzAHH9EkX/wPyfdhlBgbY3RF3KqBCRKvqqGHe5NBl1dw+o7NPygu8k5WWhJZXNYhefdR
         vwuoXiVAzOvOtcI2Zp07VpEZPzzNh73dRbfM9bIdARmAio4OZErjsxHCKx1DquLc2X5D
         dAErk9vYuymzWVAFdJk7P7YbujpG79g26VxnlFUHLwTEoTXAaVCExP3dbiNW5Sbz89In
         cfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oRhnzCWuKPecicMPuwgDWmM/IRUGzVdqDQ7z87LQhbk=;
        b=uUl958wMADjOjhngu8FrYs7TEbe28piuLy4CyA+UX6spJ0e4VtuhiZdN7Cr+EBeYgE
         Qr4gBFyRjGowX0hRI3iaf9g4TVrJmQoUpOQHHRtulKdJjPNIczqoVnyRrvPOncLV/OoU
         /6RJJNAZWJuRwBKWup8rdTBQ3EMQkhapbNDDJbawkv6L5XHNtWhBBws5XqE7r5bHZPJD
         giW332xwxNMlgBIEp00lqFIPg8LC4KBaNqJ9OvotzMwdLi8xMBvVqlI0cAqIioaKZJgE
         NVsO7spS3OtTL7ViF+5aY9fOlRCOaYoctO0qiHGsO3SqiBsTO9SX8ZBN9Th8F46GNY9P
         hOTg==
X-Gm-Message-State: AOAM531iiJWziecnTR3ibagxESc2/SAiIvua8AOo+VqqVdbH5eAXupDX
	F7e1SosDSLV6F8n1CB2BsSo=
X-Google-Smtp-Source: ABdhPJycPC+01SHXYkAI90I3AACl6PgQls13ile8bUJ7Q0/pCqYbyeqqhwtzkYpcZNFO9NVdlL9Clg==
X-Received: by 2002:a17:902:f552:b0:163:f64a:6154 with SMTP id h18-20020a170902f55200b00163f64a6154mr3704270plf.147.1654158320121;
        Thu, 02 Jun 2022 01:25:20 -0700 (PDT)
Received: from localhost (subs03-180-214-233-21.three.co.id. [180.214.233.21])
        by smtp.gmail.com with ESMTPSA id b20-20020aa79514000000b0051b97828505sm2865595pfp.166.2022.06.02.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 01:25:19 -0700 (PDT)
Date: Thu, 2 Jun 2022 15:25:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: uclogic: properly format kernel-doc comment for
 hid_dbg() wrappers
Message-ID: <Yphz7EnxGSG2eMRM@debian.me>
References: <20220531092817.13894-1-bagasdotme@gmail.com>
 <3995c3d8-395a-bd39-eebc-370bd1fca09c@infradead.org>
 <YpcU7qeOtShFx8xR@debian.me>
 <053f756b-fafa-e07a-4308-0a5de8dda595@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <053f756b-fafa-e07a-4308-0a5de8dda595@infradead.org>

On Wed, Jun 01, 2022 at 05:18:52AM -0700, Randy Dunlap wrote:
> In Documentation/doc-guide/kernel-doc.rst, section Highlights and cross-references:
> 
> ``%CONST``
>   Name of a constant. (No cross-referencing, just formatting.)
> 
> So '%' before a constant value just helps with the generated formatting
> of the output. It's just "prettier." No big deal.
> 

Thanks for suggestion!

-- 
An old man doll... just what I always wanted! - Clara
