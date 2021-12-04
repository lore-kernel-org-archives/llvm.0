Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6BC2CA2
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 00:47:25 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id j11so4681703pgs.2
        for <llvm@lists.linux.dev>; Fri, 03 Dec 2021 16:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=82zoxTyylQxErFpnuqHNAfQjAlvM/1ajL8oX6RGNRyI=;
        b=aMSOLBzknMmr7Jy2594bk5fDz23voRIfH9ahtg/4gH8smT/JhXJoq4fjXKCbOOfQjh
         JUO/v7GkGRHtren+t3KBBl40Rs/JgiZblRLOWgoWBhOBRf8qzifPQlnq6XSj/enr9ThV
         1aOzFbaf4wrME/iyezfw4MteryJuFrUZrU/14/clVNgji46r3pj9Xtsb9Wxy/mJ9hfnc
         JVQspMpiF/UGMiBOj7zJNGxjrMo7KwQ0uwTqgEXjylne4xjRtWT3V8v0voG8ixydYmOP
         Ni0yDsASH66wl/cQXwUJtHxssbuRy/tL9jd9QMez6T4f5pZDY7dd78TAtoE0GY0mVAM0
         iuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=82zoxTyylQxErFpnuqHNAfQjAlvM/1ajL8oX6RGNRyI=;
        b=tIW0pXfrntFN3ND0FZoGftXi8KpkWaZPtDcgr+hZ5FqVNx8S/fmHMPy1tKvT8zy7qw
         0/oFSPlpqPGeg2sTCeMTiGUEtJ/ceJEQoYNvOATDvBmdCd3Q4rjGfkkpMIu3p5nqB4tD
         EJP75PUEBiOQzDyEK67NW/SD0dNyl9z73ucckUEMToLtYqwgsG5uC+9P1O5q4o4M01x2
         qOGDkHPTPVQjFxqdvOUA4u/9TfPZhBdPKFxVvZKD8PHmLkS+YI8kgVWFT3YlbOXmsMQ1
         llh6HDfRarXot7i2s0TIQAoH0kTcK3IUu1I86gN+FxPW9FK3yjVRYLkiVd95iiOTo21g
         vqlQ==
X-Gm-Message-State: AOAM532d5eiKiJLYf9c6KyIWy6u9cwoUS8a7x9vcHtY4xiO+7eyrt0lF
	GknG+3bgBfrtJFQg8aZbqRY=
X-Google-Smtp-Source: ABdhPJxcDwxNnWas1calrP2vbMdflZjfU2uftdHg9+YuF/nnzOevI8b8awiRgB40YfH/csy2leAZ7A==
X-Received: by 2002:a05:6a00:2402:b0:4a8:4557:e96b with SMTP id z2-20020a056a00240200b004a84557e96bmr22050497pfh.76.1638578845439;
        Fri, 03 Dec 2021 16:47:25 -0800 (PST)
Received: from localhost ([2405:201:6014:d064:502e:73f4:8af1:9522])
        by smtp.gmail.com with ESMTPSA id ot18sm3589156pjb.14.2021.12.03.16.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 16:47:25 -0800 (PST)
Date: Sat, 4 Dec 2021 06:17:21 +0530
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
Subject: Re: [PATCH bpf 1/2] samples: bpf: fix xdp_sample_user.o linking with
 Clang
Message-ID: <20211204004721.ubdt2kcshorcmhw4@apollo.legion>
References: <20211203195004.5803-1-alexandr.lobakin@intel.com>
 <20211203195004.5803-2-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203195004.5803-2-alexandr.lobakin@intel.com>

On Sat, Dec 04, 2021 at 01:20:03AM IST, Alexander Lobakin wrote:
> Clang (13) doesn't get the jokes about specifying libraries to link in
> cclags of individual .o objects:
>
> clang-13: warning: -lm: 'linker' input unused [-Wunused-command-line-argument]
> [ ... ]
>   LD  samples/bpf/xdp_redirect_cpu
>   LD  samples/bpf/xdp_redirect_map_multi
>   LD  samples/bpf/xdp_redirect_map
>   LD  samples/bpf/xdp_redirect
>   LD  samples/bpf/xdp_monitor
> /usr/bin/ld: samples/bpf/xdp_sample_user.o: in function `sample_summary_print':
> xdp_sample_user.c:(.text+0x84c): undefined reference to `floor'
> /usr/bin/ld: xdp_sample_user.c:(.text+0x870): undefined reference to `ceil'
> /usr/bin/ld: xdp_sample_user.c:(.text+0x8cf): undefined reference to `floor'
> /usr/bin/ld: xdp_sample_user.c:(.text+0x8f3): undefined reference to `ceil'
> [ more ]
>
> Specify '-lm' as ldflags for all xdp_sample_user.o users in the main
> Makefile and remove it from ccflags of ^ in Makefile.target -- just
> like it's done for all other samples. This works with all compilers.
>
> Fixes: 6e1051a54e31 ("samples: bpf: Convert xdp_monitor to XDP samples helper")
> Fixes: b926c55d856c ("samples: bpf: Convert xdp_redirect to XDP samples helper")
> Fixes: e531a220cc59 ("samples: bpf: Convert xdp_redirect_cpu to XDP samples helper")
> Fixes: bbe65865aa05 ("samples: bpf: Convert xdp_redirect_map to XDP samples helper")
> Fixes: 594a116b2aa1 ("samples: bpf: Convert xdp_redirect_map_multi to XDP samples helper")
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---

Thanks, something to remember to test for next time.

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

--
Kartikeya
