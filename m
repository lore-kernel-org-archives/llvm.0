Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB08F44
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 22:06:51 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9so21567098pll.9
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 14:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FnbKiO7ajEV7SWU0kUyNEcHLUgki6RWJkndix3Av1gE=;
        b=BfK7XPga9+5vXyUQP/v/aDW7Ka8vj9ZKyVNeKr+vpx+bcmPMsQuyUDO1oFuXEe6JG+
         rKdPLD7AC6VpKpBGiGrG+5uT+b+rkVYgt/1ErXvL76wmK9aiIrDKpRW4ymU8kWJfn73s
         ZVx7dMRxLaxDIBX+1sE9G0T/Pm4T9KAQw+UXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnbKiO7ajEV7SWU0kUyNEcHLUgki6RWJkndix3Av1gE=;
        b=0pF1O8SuXMlxwWlMlqzii0t9G7gM0VMgDwv5Xic+mYROZzvSZF/i4gI2ykAb5m5t7C
         uUWM3u4qy+cApopGLebYDrj2TINVklgMUB+EiYeDZsGF3A4ZmNCexQlJGxSFHU6z/DJh
         aBaBDx/yIvjENkrfYTCsSMjyGhwz+3QLgMUSxNT6ZgPzsZJO9/1L28G0/zPaBMOR01Ue
         9UnQysj0PmpOqBp0pdBM8TCvg/yp9yWlELkS+k+/HwWxKEIBHKAYbrOxQ1DevFAo2GL2
         vqn/g+HtqkdUhp6s8ma4zecTtVlS3LvV1h5zIi5QRx005TPQ3vKFP37vPZwEppFbtrzx
         chuw==
X-Gm-Message-State: AFqh2kpyuWbylMwixnfMTxFWd54Dki3kkGWtfZlN3NYYOGo7qOxk/wX/
	zLs4UHLqixcF+UhJr6HWosEbvA==
X-Google-Smtp-Source: AMrXdXs8n0YkIxD05d524WSSC25s1n3FfRw1ADxQs7JTf7HSV70djM+27SyCQh2Rsa5KQa+0i78IpQ==
X-Received: by 2002:a17:902:6a87:b0:194:6d39:5911 with SMTP id n7-20020a1709026a8700b001946d395911mr490309plk.40.1673561210990;
        Thu, 12 Jan 2023 14:06:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t2-20020a170902e84200b001946a3f4d9csm226007plg.38.2023.01.12.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:06:50 -0800 (PST)
Date: Thu, 12 Jan 2023 14:06:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] scripts: handle BrokenPipeError for python scripts
Message-ID: <202301121403.599806C597@keescook>
References: <20230112023006.1873859-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112023006.1873859-1-masahiroy@kernel.org>

On Thu, Jan 12, 2023 at 11:30:06AM +0900, Masahiro Yamada wrote:
>     def main():
>         try:
>             # simulate large output (your code replaces this loop)
>             for x in range(10000):
>                 print("y")
>             # flush output here to force SIGPIPE to be triggered
>             # while inside this try block.
>             sys.stdout.flush()
>         except BrokenPipeError:
>             # Python flushes standard streams on exit; redirect remaining output
>             # to devnull to avoid another BrokenPipeError at shutdown
>             devnull = os.open(os.devnull, os.O_WRONLY)
>             os.dup2(devnull, sys.stdout.fileno())
>             sys.exit(1)  # Python exits with error code 1 on EPIPE

I still think this is wrong -- they should not continue piping, and
should just die with SIGPIPE. It should simply be:

signal(SIGPIPE, SIG_DFL);

Nothing else needed. No wasted CPU cycles, shell handling continues as
per normal.

>     if __name__ == '__main__':
>         main()
> 
>   Do not set SIGPIPE’s disposition to SIG_DFL in order to avoid
>   BrokenPipeError. Doing that would cause your program to exit
>   unexpectedly whenever any socket connection is interrupted while
>   your program is still writing to it.

This advise is for socket programs, not command-line tools.


-Kees

-- 
Kees Cook
