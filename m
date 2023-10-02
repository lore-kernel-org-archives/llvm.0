Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A4617C9
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 07:06:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50336768615so26183017e87.0
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230417; x=1696835217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGSmVU6eV61MEm0eDF1LjmBvte+gjgPeqhrseQVFPWQ=;
        b=zDLwwckMerNOvcTvtoCOXNa6yLpXBaxRhm9D7IB0t+BgQjZrB1Xk25Yc1Ma+Hsfa+f
         09tCJFA1b9n2Vt32VD1D0jQKiNw4qdzpfR2u10xMJNvTm+874p22OCOxYPunc/wbOdPa
         k6ga/gHXJTJMXmavmdovHMoDo0qbmAIjsCnDfpKN446jdGpILxx6fIYKiXBmcU6UBNml
         9Miny/o8ka5XAqU2HSSYi1L9l519/ZcHTg1WkrPnK8/DMvZbcpoelzftsMVPrVQr3xPf
         myjndkYjEmEWf8mQANt0SygpS6owYZsSshPUAjbWi0PUe8hDovmWzwOMamLlA1eEMd9c
         Gy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230417; x=1696835217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGSmVU6eV61MEm0eDF1LjmBvte+gjgPeqhrseQVFPWQ=;
        b=gYQdF2Uyute+emHT7x6TUUUrzp8ObUHT9hUeVThZ1tSuxDxv/iCeTXdGTrJfBLof96
         SDta3akEn+Np95JKf4BfxTgSZTkxj4M5ZHGFyKBZPdPNRftyg8KFdDKZOh+NdrSWaRvB
         WUG1riSLISN5Zr/+vXWyP5hfrSYaHIwHE20m56YGRQDxEtdsdAilNZ6IhtVrz9nptobq
         0ymd4cJk7PTfLReacM634mUaP8EsQ0mD3l/uuhU+/+0/OsT2p+PQH9Ll7gYCEBIq+gIw
         ggrWWQnPf4hdBS1OLEXONBWp7BPjCKm33X/61AaRdn0rUUH2Llqa+IIhnLXNcI7R5Vvr
         KRHQ==
X-Gm-Message-State: AOJu0Yz0htppwweLwfzUZ50WVW+VGHWVVE+fSC9hafAx3vBDXWXF6Jsk
	COuAZPMTEXbJjCjf0hsogWuZCQ==
X-Google-Smtp-Source: AGHT+IFqNxtPg80t50ZYFfWxUt2W5y2FEtd43xRb6YCWO1WM7DYE1bqvmoOMC0T13JN44j87ql34Rw==
X-Received: by 2002:a05:6512:1598:b0:500:78ee:4cd7 with SMTP id bp24-20020a056512159800b0050078ee4cd7mr10804857lfb.23.1696230417514;
        Mon, 02 Oct 2023 00:06:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z17-20020a05600c221100b0040642a1df1csm6565662wml.25.2023.10.02.00.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:06:57 -0700 (PDT)
Date: Mon, 2 Oct 2023 10:06:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Brian Foster <bfoster@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] bcachefs: Use struct_size()
Message-ID: <fdc46489-4266-48e3-99cc-ddb23b64f02e@kadam.mountain>
References: <120b638f99b088f91d5a4491c800463c554e70b8.1696144401.git.christophe.jaillet@wanadoo.fr>
 <7ae7737e-e32c-e9e7-880c-cafc240e7c33@embeddedor.com>
 <ff682afb-a914-4cd7-8d19-202a6cb778de@kadam.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff682afb-a914-4cd7-8d19-202a6cb778de@kadam.mountain>

On Mon, Oct 02, 2023 at 09:42:06AM +0300, Dan Carpenter wrote:
> On Sun, Oct 01, 2023 at 09:23:17AM +0200, Gustavo A. R. Silva wrote:
> > 
> > 
> > On 10/1/23 09:13, Christophe JAILLET wrote:
> > > Use struct_size() instead of hand writing it.
> > > This is less verbose and more robust.
> > > 
> > > While at it, prepare for the coming implementation by GCC and Clang of the
> > > __counted_by attribute. Flexible array members annotated with __counted_by
> > > can have their accesses bounds-checked at run-time checking via
> > > CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> > > strcpy/memcpy-family functions).
> > 
> > I would prefer this as two separate patches.
> > 
> 
> I kind of feel like it's all part of one thing.  It's easier to review
> as one patch.

Also I think there is static analysis which sees struct_size()
allocations and pushes people to use __counted_by() so doing it in two
steps is sort of like introducing a static checker bug and then
silencing it in the next patch.

regards,
dan carpenter

