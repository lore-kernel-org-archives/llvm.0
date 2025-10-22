Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DAA21A459
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100023; cv=none; b=qmTf/MMKQiC9TjQ1W17kP1YVD1Xg3bSz6bkZEcJXVds8B662DDXO9AzaVxotcSdZ84lpnlKhOH0STpm02jeqcXr90HSy0RBsikUdWdyfWlLv1EqYCMXo8yUkzjcWqjqveIzdDKcvz7KE6YrorPIJ3adRDtkNci3O5hdy1uOxshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100023; c=relaxed/simple;
	bh=GHDQMCS5dEWxKn+0Txm/veOfLoI8l83ajhIWcN5rWOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJYy+H4/oAtxKjiS3jiuWqGAhX6FG012RPstmMS/UhS0cNVbFgdsHQ3fsMZJ768Z/ERiOJJgXWbAFj6Hz3kSnCMzVuQY054Ro9RO2jSlXFDOZ/zxmqNUNHj1QAGJGSrXs/Q+JyAQPttN7tvN8pJRj6sB7TPt7G7a5UcS+x7LVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYnaYQTs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYnaYQTs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-793021f348fso5642684b3a.1
        for <llvm@lists.linux.dev>; Tue, 21 Oct 2025 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761100021; x=1761704821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
        b=FYnaYQTspLtYtjwfXjpevsVENoqbYGnzmisVHEPwW8bBJV31GETIqNv8AdQVf+oVkE
         xL7vZoGqFANcgbakQ/7QB9YcMMv3F01cW5bgARhl5zazcfNnYYx6JaRrP6m0FoyUuku5
         jtIcjmZr3tXlv7irdvAFrkRP0TC19D4bmqRbCmtu+RW8BbeVUqvN6/ZWAhRLVE5DqsfZ
         TYqh32BRxGP1HtkKCe1Nj0/JSiHb98lrPSSjLW4CSpEp8kA/GPlNQkx0urjdiMW4Dn+Z
         8ND1V6JWStJPiM1NhhOqoYrApcKXw9WP0XuHq1ZKS+v9cwhI/olfOs+JzbHtUcb529Oc
         NYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761100021; x=1761704821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
        b=akl6ltMq/Mf2vo8PLSHlGQY+IbsK3joE8ONXd8jPIiR25oQzyb4iL7H/b4mIbg6Xgw
         HYxAEpBaIeWLHHJXS5XDP4VoKZ+v6meNkrAr96kJn9pTlP6ET+mBzpi2WBQk0VdJRhwo
         fbHwFMdy0p7kc/Xv45XPbJ0ei/xGVy7a/7x69lycb611rHMQWj/QV1JWe7Q+ujWlpv3f
         E1ODoQCvkWXqwpXSQtVwbyfY64OAVFrnjHSIiMwoLKSkTmziO2Jaj8NfadNyqy28SBwD
         GBlEQmOL1kvG7VlP8F8vYwXrXDqr/5RcBmssG1evxST7SeY8eJg/fGGBguLqhrgf4eZy
         VqCw==
X-Forwarded-Encrypted: i=1; AJvYcCUuZluaKyuWJsNxdizHYfKS7ospjbhsYvYnMDZYrHWabJQskWumDAElAE/2odThs6VYstUm@lists.linux.dev
X-Gm-Message-State: AOJu0YxskXh8nDJKS/X1J3RdTlEF7sghsQgYco3KmpfcZ950S8bHnhFZ
	7UBLdZV3O76W8Z//gkdOD5vJL8gKVOghhimL6qWg3BqPGkcHIPXEVAlfwhq0JQqvLJo=
X-Gm-Gg: ASbGncurvbsRu/VP2YeVtA0gbZetqMuUS5rFdo5485ZoLtg3xdSJ4/mkqFw3i3gMJ6W
	leSgDGBw095RmDwaIsxS5ZcEmBxbvpR/DNaaPdiWjg72ji68on54ZG1L4H6PdkrIhryAb3unilp
	k4hG9oyKRNrbKFodKOeY+EXZd23awa7CP2Gps+mSAJAthrlP97n76RYRWKH4qux+37bRYNw3yQv
	gbfWAmnE4Va89aGwjy5FdAtTjWdMt7vtu5wKysvvxJEDc9ChXcU8eSf/sxd/n3dp3sZ4br/Ghfm
	f/vozhnnf1YJUi/+BV16PVnfwSP2qu8kLXrvN9yg42O/GfzI3VOJf83KbMIU0b538Z77ZF1Edfq
	tIyyV/XWkIkUSUefBcGimnjShDvy0mInTB1uTlTdYyyULDrUoqUOnQxwg2jWnZXdxbdqWExI+Ko
	SY6g==
X-Google-Smtp-Source: AGHT+IEiODVZTmpBKH4GJGfRgQpdF+p0v4t2QcX4SapXa+98D5HxqE/HG1opMUzT/b2Bq6W9RKZPmQ==
X-Received: by 2002:a05:6a00:2e1f:b0:781:171f:df6f with SMTP id d2e1a72fcca58-7a220b14d80mr26349244b3a.18.1761100020948;
        Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23011088fsm12778187b3a.65.2025.10.21.19.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:56:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
Message-ID: <75keuxnrpd2p2lumgmoxpwt42ovsx4xyltq3dimarvlspjq3gn@cmadekc427tk>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>

On 18-10-25, 13:45, Tamir Duberstein wrote:
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/opp.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
