Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6A2CA4
	for <llvm@lists.linux.dev>; Mon, 25 Oct 2021 14:41:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C558660E0B;
	Mon, 25 Oct 2021 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635172890;
	bh=Iio8TLL3Vj+MwbqGIiGb9CnzNwFLV98xO24S+zLQLns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6sta3S+dHRF7a3jyaDh9A2sv1AmRzzojEbf7YJxm+VWWHPjTzrgQ8vk5xu5VoaO6
	 QQYzxBAM5UhoMav2Z2FWRkSeZ4bYvFzsZAhZCKW896LJlRb+z1CugDCWVtdVNJxdpx
	 0gQCHMQukON78xHUlOPGWuOzNnaMM8amqdd30tyDgmkAw+HW6SWNRgx3biWvHkLAwj
	 JLCim9VEMoE+wiDlrNZmZvN+T9MTlmeXQucIZ99jkGXWOdjSwUrQ5JO6U73LgyAN2+
	 YZlpZiTLIHxEvG7dqCbTYbW+BEXV9pY85w2TfZZRVG1H0HgnCTwemEEvmNuLX7P/GJ
	 RCZk9AP/jd0+g==
Date: Mon, 25 Oct 2021 07:41:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
	linux-stable <stable@vger.kernel.org>, llvm@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: i386: tinyconfig: perf_event.h:838:21: error: invalid output
 size for constraint '=q'
Message-ID: <YXbCFdz4R7cikpnE@archlinux-ax161>
References: <CA+G9fYuhRwQhByNkWQ4OLP7y5vBTGoWdW4KrJSzJizVsDzWQSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuhRwQhByNkWQ4OLP7y5vBTGoWdW4KrJSzJizVsDzWQSA@mail.gmail.com>

Hi Naresh,

On Sun, Oct 24, 2021 at 08:05:01AM +0530, Naresh Kamboju wrote:
> Following i386 tinyconfig  clang-13 and clang-nightly failed on
> stable-rc queue/5.4.
> 
> Fail (119 errors) with status message
> 'failure while building tuxmake target(s): default': ea3681525113
>  ("net: enetc: fix ethtool counter name for PM0_TERR")
>  i386 (tinyconfig) with clang-nightly
> @ https://builds.tuxbuild.com/1zvtvNS4eyYkOMiXtFgR7n1k0Yc/
> 
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=i386
> CROSS_COMPILE=i686-linux-gnu- HOSTCC=clang CC=clang
> In file included from /builds/linux/arch/x86/events/amd/core.c:12:
> /builds/linux/arch/x86/events/amd/../perf_event.h:838:21: error:
> invalid output size for constraint '=q'
>         u64 disable_mask = __this_cpu_read(cpu_hw_events.perf_ctr_virt_mask);
> 
> build link,
> https://builds.tuxbuild.com/1zvtvNS4eyYkOMiXtFgR7n1k0Yc/
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

I am surprised this is being reported as a new issue for 5.4, as it
should have always had this error [1]. We did not fix this until 5.9
[2], meaning that 5.10 and beyond is fine. The series that did fix it
was rather long so I am not sure it is suitable for stable. My
recommendation is to disable i386 testing for 5.4 and earlier with
clang.

[1]: https://github.com/ClangBuiltLinux/linux/issues/194
[2]: https://git.kernel.org/linus/ba77c568f3160657a5f7905289c07d18c2dfde78

Cheers,
Nathan
