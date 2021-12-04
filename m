Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE122CA2
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 00:47:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k4so4643371pgb.8
        for <llvm@lists.linux.dev>; Fri, 03 Dec 2021 16:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1NXW96FULaq9MCh+MikxqVORQr2ZBOfCRWVjuh1Jzis=;
        b=Djbf+mJRsfMrGfOHRmNHs1aF9bv5dEmaVVNI8EEYjqDGWPfG+Jampf9GTMubipT3/z
         sQBazHZTHH+9bifmmiQaeVtqA5TYAaNnLQQZvR/LQkmzyxx8Jwz5eTRYtrapJCBrUORB
         TyWZ3D1800bAM3QaOF+Ip5Y808ZsGLdYI6JzTG5IBU/uzHYSRURLH5EtuCiZ0dgGEUpp
         o1aXIhu4IzEeCo8GXMza+BI7WvvJwwFPVq8Xq7AdN9oT1iiee4EUiLdY6UOymks48qDp
         f3kudYtZHxH7MIqWuWONqkciAhgWLpcvdWxzTDXjigfWme8quV3uRh5AFpSZme7PjUmz
         6kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1NXW96FULaq9MCh+MikxqVORQr2ZBOfCRWVjuh1Jzis=;
        b=t4zQ1n5Z3FhjmjEFeSB72Rk1yguV4IwrSyS3sH645szAGwmQbOAUo8T/eeCa+kwIkD
         7gjA3KaMPtxL9PXFtj69ouY4mD8XGX1/QdWxrtdIFYF6GU4O3mNEb0G6DrbJnsVIKAe4
         KqRh24WU8YgcHY1uCmqfeH2tJ2pQ3dIqdYS1bvot1Gi0qJiWSnnNaAmGoT7myDeASnEi
         h9h0V8YYaHr3C4HE+BXoNfgivfVkNC3tDLBb5G83QJN5B49cvXsigBnZxdTgwwdgm3IY
         LGMlbj0KHsDTfLg7j4xlJjC7lG9P627DneB5x6OKURoSzLM4WmeSKD2CBRFOSIuykFq+
         dPoQ==
X-Gm-Message-State: AOAM533Qho0hnixPO3MWzXMUpA24l53MfZHDWhTufwWOqw7/N1YeRtrH
	pAxXY1RoK16pdV9e3xeqfMk=
X-Google-Smtp-Source: ABdhPJwsr7y5BMX5/TVxi4p7OUi6OqtQU4pwpl0F6RZSVT4tTF8u9D27X0kG2fXgW/DTbSlhh19OPw==
X-Received: by 2002:a63:8bc7:: with SMTP id j190mr6955899pge.240.1638578867239;
        Fri, 03 Dec 2021 16:47:47 -0800 (PST)
Received: from localhost ([2405:201:6014:d064:502e:73f4:8af1:9522])
        by smtp.gmail.com with ESMTPSA id t3sm4856500pfg.94.2021.12.03.16.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 16:47:46 -0800 (PST)
Date: Sat, 4 Dec 2021 06:17:44 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH bpf 2/2] samples: bpf: fix 'unknown warning group' build
 warning on Clang
Message-ID: <20211204004744.eqakjotrfu4ceksp@apollo.legion>
References: <20211203195004.5803-1-alexandr.lobakin@intel.com>
 <20211203195004.5803-3-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203195004.5803-3-alexandr.lobakin@intel.com>

On Sat, Dec 04, 2021 at 01:20:04AM IST, Alexander Lobakin wrote:
> Clang doesn't have 'stringop-truncation' group like GCC does, and
> complains about it when building samples which use xdp_sample_user
> infra:
>
>  samples/bpf/xdp_sample_user.h:48:32: warning: unknown warning group '-Wstringop-truncation', ignored [-Wunknown-warning-option]
>  #pragma GCC diagnostic ignored "-Wstringop-truncation"
>                                 ^
> [ repeat ]
>
> Those are harmless, but avoidable when guarding it with ifdef.
> I could guard push/pop as well, but this would require one more
> ifdef cruft around a single line which I don't think is reasonable.
>
> Fixes: 156f886cf697 ("samples: bpf: Add basic infrastructure for XDP samples")
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> [...]

--
Kartikeya
