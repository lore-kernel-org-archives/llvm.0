Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286528DAF
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YbZvCCuq"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-564af0ac494so1834407a12.0
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624017; x=1697228817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ik+8xyOrxrDENzMU2+XdXOoH+BEnHgLDW/RYA7oHq4=;
        b=YbZvCCuqWjcLucUgLr8tniRGxmsKHfqEufzVnIM6gsRs/tO0s096C3u3SF52ugoCOe
         A5R19D0Vn3vGqwDGnTGBGNTLMEue+hGa1WRrqXu+xe7Ws19hvrAJNYYqoGeHxEr9h4cs
         HeiGPKgF4suNIV9b4IR3uRzxpumPi1/tHe50M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624017; x=1697228817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ik+8xyOrxrDENzMU2+XdXOoH+BEnHgLDW/RYA7oHq4=;
        b=FsPcH5FbHGRRL5L6Vt5UwiD5DIeS3rpdQQAAL6wUhuD6mskNwFTKd3KMNrUAhzI97i
         kQGVfeddLojZJNvOMMEpEUPZoWG/DaPw+oNawnNdSow2ySDsx2+V5jigV/lL0pDs5CNu
         z0MG66xAS8gcPvQZnM9bCCe6LHpkvIMdeF4579HRZNslv3E3NsKEFvxzFsNR2V67VZPV
         mVEo0F0AKcVYKjdW3MRg8mVHy++uE1iF6C2vX9HKgD6h9uEq9EXZFQgcGM/diPFdy7Nc
         PJaV5pLjEM3v0BvF4/mShJdJJvcR7iYpnWIle4UT9Pr30gR4ezLylBJEqhIpnEDaoD6U
         MzTQ==
X-Gm-Message-State: AOJu0Ywbo2RBrNn7M6eagHiC+EJJZkKKNt1Fc/1Uu7zbuG4wpW/Jwr8I
	Hxhc9wZEekW8ItqR+PjDHeLKuw==
X-Google-Smtp-Source: AGHT+IG2uZ4oQ6pqs/gPUxE9hmNLIVY3TcFTdzCBj+5FryP0YVUJaPRylWXG7huLOl6hdWH/tBpVog==
X-Received: by 2002:a05:6a20:3942:b0:14b:8023:33c8 with SMTP id r2-20020a056a20394200b0014b802333c8mr10453505pzg.2.1696624016776;
        Fri, 06 Oct 2023 13:26:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c8-20020aa78c08000000b0069102ae6d93sm1952733pfd.14.2023.10.06.13.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:26:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "David S. Miller" <davem@davemloft.net>,
	Kees Cook <keescook@chromium.org>
Cc: sparclinux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] sparc: Annotate struct cpuinfo_tree with __counted_by
Date: Fri,  6 Oct 2023 13:25:46 -0700
Message-Id: <169662394357.2154428.12028362294967452741.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175159.work.357-kees@kernel.org>
References: <20230922175159.work.357-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:52:00 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cpuinfo_tree.
> 
> [...]

Since this is a trivial change and it's been 2 week without further
discussion, I'll snag this patch.

Applied to for-next/hardening, thanks!

[1/1] sparc: Annotate struct cpuinfo_tree with __counted_by
      https://git.kernel.org/kees/c/cfa36f889f23

Take care,

-- 
Kees Cook

