Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61A9CA70
	for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 16:36:16 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3af608eb34bso2578361b6e.1
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 09:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696091775; x=1696696575; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyt0KGC1OcelyqP8s+Yq2xN5/wo1kjcQggShUtRbwZo=;
        b=TVjqsEIo5k2uCe5Lw9NECcmCMaveiN/BUdVJpF+g9r+7VJ1C/+sePyRD2ETjHOEERC
         XHVNQOeQqgp8h8jNAH8gWOD8Uc9gVjThOE0Qm6syA1Hiss6saIaYzT+aCyVjIMb9p2n4
         p363xa+lVh+LeLcn9teLNgVNV2dJupzHedINTwaJ24H6N2y+1LcOkfv1Zk5pkUh/kJPd
         r08Ye0EATUrVCjcaW5BjeYuP7DZABtLZWefEb/e58XE/8BuLiAs7K9fGxrbVoeRoQzo1
         yqpu7WHc0s6IPLB9OpOUEyjr9mIPoqYYtVMjh5lIqihi4OItIgf5vUkAT6QuOAIatkPg
         6JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696091775; x=1696696575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyt0KGC1OcelyqP8s+Yq2xN5/wo1kjcQggShUtRbwZo=;
        b=ggGZuV7GAmp7wDE5QayyGFIihAWTiQ9ZusjSQyltfVvrDRBzmZ9uudwojoeAWeMl8u
         TG1DhnsIPAmsm5ElmjKS4sUvW35d1LS/ATMs9fq7yeoZydJ6uaL2/V8EpI2+H/8aHgOA
         AF/RJJdgQBTL7JLetDR/WveKekEliNnGVapcrErGK9wNX+0jVrVrGweZothUPwT0xd++
         zq01vQgXbpWc5daT9qZu8995RNb+jLLeqJKSzqQlBhFNR4cSnRw6nLoAGiITChgxoB8N
         edBG5Wl6J4VfwTtCAKb4p0wz34+XNek5fGqQ+tOyCvQXIwpDxZt+YLHiAcb/VZSI5rDj
         bw7g==
X-Gm-Message-State: AOJu0YxkStCVlH9MLGLS0fV29otgCtvv8e+ds7J1FZgn+yeY6OOcGs0J
	yqaNxRL9VgHVzILVvVNVwkQ=
X-Google-Smtp-Source: AGHT+IGrp36U8oVS9oihnUJtqY2rD9L79m36iKwc0SNUFVgHabnFPmI2BXNhQulf77W7U4MEhKzTUA==
X-Received: by 2002:a05:6808:f01:b0:3a9:cfb5:4637 with SMTP id m1-20020a0568080f0100b003a9cfb54637mr8914851oiw.38.1696091775406;
        Sat, 30 Sep 2023 09:36:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a90f:2dad:30c1:d923])
        by smtp.gmail.com with ESMTPSA id f18-20020a637552000000b005777a50c14csm16343594pgn.0.2023.09.30.09.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 09:36:15 -0700 (PDT)
Date: Sat, 30 Sep 2023 09:36:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: linux-input@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] input: Annotate struct evdev_client with __counted_by
Message-ID: <ZRhOfEiwNbiGHzft@google.com>
References: <20230922175027.work.563-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175027.work.563-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:50:28AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct evdev_client.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thank you.

-- 
Dmitry
