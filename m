Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246107E3
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 06:42:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-307d20548adso14627517f8f.0
        for <llvm@lists.linux.dev>; Sun, 01 Oct 2023 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696228941; x=1696833741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFLmBMbTAf5mYpVSeF0tgLxlIm+hQtraBWqw0SVaZ1s=;
        b=e6ZQOqU/J8WnK0yyMPnXmdQUgfTpSF+JmYvnkKfLd+UIstosDnUx19Lyf7XKqiZPtl
         ZJ6cpO1PbkglIFVtzE1MAzjqtRH5hBlrIWLDWLyMfVq0Uvtd+jB67Bk0HjFgLSF+gW+2
         3abga/2k0tJIDo3QgonB4m17D3zPi2OiPCJo1wui/kM/HLVa9V2I31miD1Z1DyibLtOd
         BDQ7sf8gygaAyDfAvbcPzsRu1WlUi49gna0jyqsW18eukKh7YFMulqzV2QEBQ5ImMcnN
         037JDr4Vq0a9GP0RDK+DH0+jiyzttKYuQk9277+t+eV7DT/EVT7+E95ZoLmDrcCiOhno
         9fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696228941; x=1696833741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFLmBMbTAf5mYpVSeF0tgLxlIm+hQtraBWqw0SVaZ1s=;
        b=m2Io1p1ygS6ZRCE3Oy/Yzmc9UaLOKVUP2wXqPiGQtH8ZDOkYsUm5TCNxwqV5r0p5Rf
         RfBDYhFxPvooHNH2uq7w+30ZQEn022k+TPaOOHQ9p6aMeGWzDnQJQoorCPPFQan+2hT8
         r+8hGqqq8iq7uYhvNQpXTKVAtTLVmaTNPNkP0B/FtRREUYk3yXTGdQ8+7KN9UoNGwCoA
         fg4hU4crBNKS0fH+4K/Zr6ouv632pQtWNoqK627HBi39tsoX+uDzjYl+nSzuXCxJz1oo
         I9jyV9PL3jYBgFr38NOUCxoiULZRgqIvsDzG9NBYTcR6pQxbvb0wZ+px+M4h7DMqOz97
         piCw==
X-Gm-Message-State: AOJu0Yy1+7kqCE3SVj4hQkeVAcuxBjLHbWb0NCI2eDo2CyegSX/2JmTf
	JA2yAM/t6POamJpYqRhpztTQzQ==
X-Google-Smtp-Source: AGHT+IG5F6WCA+givsf9KFa40Uq2QQ0EtyZVPcp2/kezx1bCSCz837j2NkrcYNJnzvEwO3xWwac9nA==
X-Received: by 2002:adf:f085:0:b0:320:77f:a97c with SMTP id n5-20020adff085000000b00320077fa97cmr9346986wro.63.1696228941280;
        Sun, 01 Oct 2023 23:42:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d594b000000b003140f47224csm9346368wri.15.2023.10.01.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 23:42:20 -0700 (PDT)
Date: Mon, 2 Oct 2023 09:42:06 +0300
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
Message-ID: <ff682afb-a914-4cd7-8d19-202a6cb778de@kadam.mountain>
References: <120b638f99b088f91d5a4491c800463c554e70b8.1696144401.git.christophe.jaillet@wanadoo.fr>
 <7ae7737e-e32c-e9e7-880c-cafc240e7c33@embeddedor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae7737e-e32c-e9e7-880c-cafc240e7c33@embeddedor.com>

On Sun, Oct 01, 2023 at 09:23:17AM +0200, Gustavo A. R. Silva wrote:
> 
> 
> On 10/1/23 09:13, Christophe JAILLET wrote:
> > Use struct_size() instead of hand writing it.
> > This is less verbose and more robust.
> > 
> > While at it, prepare for the coming implementation by GCC and Clang of the
> > __counted_by attribute. Flexible array members annotated with __counted_by
> > can have their accesses bounds-checked at run-time checking via
> > CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> > strcpy/memcpy-family functions).
> 
> I would prefer this as two separate patches.
> 

I kind of feel like it's all part of one thing.  It's easier to review
as one patch.

regards,
dan carpenter

