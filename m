Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4CE21B196
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100054; cv=none; b=ettzOQLb37PQGJRvulztkYRcpfTPKPJ0tpY0mcrIkGwHDFN6Xr3e0fje7kFRXpuRJcnYGZuf2lKCIygRDBH4jMeFDouKFjL89hxc0joVMgrFK3nVWHBGGL2RWKXI3NIr+jq21GXosKOtMBBhQdUOHsuJG2UEWT2NZILN2nAzCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100054; c=relaxed/simple;
	bh=A+P0s8xM+ovp2iCRdR2wm/nwAd8dNmdnn9/2R/2q9mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWHWZ9bNKLe82VxSQ6NecMHu4k5CW6bOQ9GVQYspOPyg7ioUHPct1pG+MAqjxlFsT68K1uE720T1P9Ycrpzyr35XqKtjjyQzbQi2RxsicdSw6zfgV9sN5AIWC9a5WGcJpLWzEcYwa26p/JElDIGspgYfvT4RPtj7uKmINobIjVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOHaWUiH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOHaWUiH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33badfbbc48so7636029a91.2
        for <llvm@lists.linux.dev>; Tue, 21 Oct 2025 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761100051; x=1761704851; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Kynz5f6kQn3G9h5f1VDmHPl6BLtsPQWnOh0t3sfi0M=;
        b=xOHaWUiH0MCMei62IJ7zUBphhIxW+Vumcwdf8QVhDk9CEjmfc6cbXDcR9/IvEp4YMw
         PxakivW2V4xBB6dM6Wzg63+dv3UE+VTqocXzyG0T/NYao/vM/ZW54pneYGWCwEq6zZwV
         bBVzBwe9WdsGK3CN/SvMNDS7AqD4F6kcjRYvkjLyN3xukuOeXEAfj6lzt9Bx14e+++9Q
         XfV9gFbhhgOmLIQblrcgWPDnRQ5BQ4sui2FJvfQXpODaDYPDD70ifTbMoVGNG3NUN0hr
         Hqs+lLLMj5Zw4SEPmfIaG3CbPt7ORovRxqDqcx3hX2SaP1nbu1H8IIj8FUY8DtOe718j
         a7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761100051; x=1761704851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Kynz5f6kQn3G9h5f1VDmHPl6BLtsPQWnOh0t3sfi0M=;
        b=ej7gKIAwMSfzCRyCAl7Wr1CrskTVtxqksJLY69gid3DkpUfWuxEKiu9VfZmQ/b3vKQ
         z27BNgXoL3lL9ogf9/paxYLH6DnCpWetguN3Z/v4vjomjIUwdu766o/RFrqdWmwhQbnL
         WjTm8//imHYT6F/93DvlKgQJI6Btn2g2YK3S5gVxU4pC6TSPGfm7c92tmbU/rCAxe9OS
         twxdbrCQcy3mioJjg1oG2fhyWaXz/kHx3axdZtUx7wzIa6KZr51Ydt3WmVQ8l3zd3E/H
         xkVIR2ZR8ccfOf6ZMkMWWhJIaOAxV9nR2nFV3d/JHu68G9fk47Uy/rRLO+RpnJUujyjT
         3S+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU328XGpgSGcflPHYQjxEuqCQnSKNsOnp78l59Ip1Tq4gN39vHoeQy3W1rrXQF1kv3jpoLf@lists.linux.dev
X-Gm-Message-State: AOJu0YwUm4dlWZQzk4K6APgtp+UtN0OKyjm4bYMFMWeq9Ntu2R8sXgjD
	S/Qg7Q6QYu6kDCVSBM0BIpq5b7lT4E+aB0qwLhdNMzeDKERrMy3wKDNE2t1EZynr258=
X-Gm-Gg: ASbGncvfs5aYS6hoA81D0Yp1ERbe3reOOMwZCmM98L6Rg5fV5IXnS+sIOpZWOTn098B
	WPTHgq6S5cif2/QwWiTiDwiQmnv8kOvQhPSWwynroNSaa+lxgqFFNqZRmuLSM+lNagypmXw+AYM
	i40fUuD1wTUeA2WioV1qe6IqbtpAS+B3axK0mot6kzxyutPlOr1GBTmDIaWKnrfxzM8iglfYid0
	FTC11+xcZx4ZrqEY1cgR+YsVDzodZs84tYasCaeQIVGjxnXbjr8ay1O64OHavs0U/dhTwXeDTql
	UzbBOqQ+dhR7mFX+eXzulK/iNfP1OOcnP5wdjDi3HAYVQU7cNkEfZK1reGMLGFqf1jFzhQeN7Dt
	rJdkUAhHWFPJluUReQvshZOSIr+QgldtvU3rnDoUuVkjiztLho2VhYH3iGfPLbhRu5Clr4a3sY9
	Xwy889as2BJXqXvAky86qBu+8=
X-Google-Smtp-Source: AGHT+IFJLVFpIR1aWCyZCFOIKnAA6a58lXYXHZeAFELxfkfneTEN5uN4Dh2U6O2etE9y+Y+gRJvc9A==
X-Received: by 2002:a17:90b:1dc6:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-33bcf888575mr30106334a91.12.1761100051119;
        Tue, 21 Oct 2025 19:27:31 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f11e1sm981092a91.12.2025.10.21.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:27:30 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:57:28 +0530
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
Subject: Re: [PATCH v18 11/16] rust: opp: fix broken rustdoc link
Message-ID: <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>

On 18-10-25, 13:45, Tamir Duberstein wrote:
> Correct the spelling of "CString" to make the link work.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/opp.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
