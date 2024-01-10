Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FF6FD9
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 03:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cs5MyLhH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ce2aada130so1638881a12.1
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 19:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704856087; x=1705460887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAST3+ovgIXLtw+hGTF5zWstYPXDCThnu2Wi7q/0Obg=;
        b=Cs5MyLhHAeexNJjsn6aoQV//CWquHkj33zce3g9Q70S4x4mX7XHVOxN24hruFIFNdE
         1Xhj9wX4XXZ9cjWeoP85AsE5/rowAtQlH3WBRGUPb73oEs2VHYGMYdHc34YBeeHn/lPP
         kupMRKSG8xNlk6MxTqSub7YKPTAaGaoPPFApc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704856087; x=1705460887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAST3+ovgIXLtw+hGTF5zWstYPXDCThnu2Wi7q/0Obg=;
        b=eCmPqh1aYcq3hdoTab3JNIjHDO/4kRZYtOLi5tbk+2Yt29rAxsQznZfxX1xL8Mu7R3
         3AFEMzPpxJcE5/JsXux7hVWsLfPf9MO3PjfF94bjpnVaUI0j0LRGE026wb9WphEAcwZ7
         TaEJC5l0zNU/0zZyyGYlwXrj0HNLwwesZXu/KKO9tbvVZFDl08oHW6uS34mvVXkTaa7/
         lBO6nPPEyIuzb5HxnZtsbVNd/mpImOBuPMW3St5xTSRfjEo3ZqG8BuC5pbmrRCCJn22L
         JHvbx7g4crT1wMtfC6hYDDMsjpbct0hYnjt9CKkivHLVe25P0A4VZKF4uewJ3J5Rho9W
         HNLg==
X-Gm-Message-State: AOJu0Yx/a0tqEMhtomQKH9Wxj6fTsimj/McS1kK4Zosz8wYvwLXyN8ym
	KdsstESC5zrjsiM4xx7A3OLEy0okC2cblyioQC+6Ig09ng==
X-Google-Smtp-Source: AGHT+IELTTb3rRiLIGo4JLtmWafjDdjYVKaF9RO5ET+SuDZnOI7c8JC2l/ZA0HQ5BoJQ8RxwkSh+6w==
X-Received: by 2002:a05:6a21:3396:b0:199:939b:c446 with SMTP id yy22-20020a056a21339600b00199939bc446mr235287pzb.28.1704856087048;
        Tue, 09 Jan 2024 19:08:07 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b1d0:e755:54c2:4518])
        by smtp.gmail.com with ESMTPSA id jh7-20020a170903328700b001d5087c5e7csm2515002plb.92.2024.01.09.19.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 19:08:06 -0800 (PST)
Date: Wed, 10 Jan 2024 12:08:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCHv2 2/2] Compiler Attributes: counted_by: fixup clang URL
Message-ID: <20240110030802.GC1282549@google.com>
References: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
 <b7babeb9c5b14af9189f0d6225673e6e9a8f4ad3.1704855496.git.senozhatsky@chromium.org>
 <20240110030258.GB3624259@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110030258.GB3624259@dev-arch.thelio-3990X>

On (24/01/09 20:02), Nathan Chancellor wrote:
> On Wed, Jan 10, 2024 at 11:58:18AM +0900, Sergey Senozhatsky wrote:
> > The URL in question 404 now, fix it up (and switch to github).
> > 
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> I sent a patch series today for the rest of the tree, which includes a
> link to what happened here:

Thanks!
