Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E52747B
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 23:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759793993; cv=none; b=MRHycv/ru8YTSKRfBL1sJVSsmX2KdhFsYr90h/+KcDJvjjHQ51ITeFMrkQLBdNoulwT9Jpwn0yiXOe4mFkV9A7i97s5tEX44/V4elZ/QLZnC/RDzkBiQZqKl0jCu2Dg5VNswkGklLDRtDa8wRzRYehMefI9MlLMQ/ODibQgBEcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759793993; c=relaxed/simple;
	bh=Gns+VlYyW80ZkP3KAJMY8rFbhbpsU6HpY4D7cIcI7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbPNIY1QkxL0tJSCTHPT1GHH8EhgG4EgqTk8wTCd7gREMny4l0Dz3H3wPfy0LeMUoaBafPuJcAuYrxGtJFz5SZvw+ihw5Tgl23S1UiEaDoCAucgHAMO2pLDPpcVuGxMrNg2SO2W2hUpCNVdwWOYcW98Ql0Vm+2x974gF5u3bq00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=avDEjVjU; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="avDEjVjU"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-930cfdfabb3so287987839f.1
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 16:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759793991; x=1760398791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9TZOyB/EMo09OKq3vpFLrmNzk6bmCMZmlPS+l7lrX4=;
        b=avDEjVjUrRh9h4BXjSdjxcJKI/vRSSQI1NoyzBFwAOVYmreH3YB19HjxU3TGqVQkvb
         vUFbu5Yy00ikHXPz0KFbCJDmuC3aqa++d1n6rWh2mFjTc/NIWnzBCcTOs07b8FeR/mgw
         4+9MhbQCoYX0qIU6LqSiZwt7DgfjZ5slVnizRD2c2vwzWPXGQUrssfqwP5dO3aIdGv/0
         DBXIR0zrx0lLYfPktL7Gxq1N/x+IAcKSOV7jansFMfLPC26SNhGFhP0gXUWjjIa7Wc0I
         wsquYPDioXLrJAYpCvOjg6Ia1r7xf3ETM1VJ3RvvjRZd19qILLBhGbWUFSIXu9lKSwTA
         s2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759793991; x=1760398791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9TZOyB/EMo09OKq3vpFLrmNzk6bmCMZmlPS+l7lrX4=;
        b=mHEBHGiG+uiJHkdXOeNuOqSlK42vpyl9ISUnxswyYK365coxLcI+XElLd33TB8CgCM
         4jAT7CL8UUJMADWjos3QjrkYfXFSxMXmgu3Xlyz/fcSR/wTrjyumfE3Gdovh/hRztY1l
         1z1wTxJPnUG4rHPCjIUUHCdzgqlVTiDZTFlhOCYcbRQNqW7XFAd/5ilKXH+OKErBNI3W
         swHAui4fMwHUojCzZu2ZyZE0aw680ro+50QZumQmWG7IWjyya4l/uGzsyk4toAtIQ5PO
         geS9PpWsK3R9KfC7AhRIkqwKbs5GL11ym9EcsAC/WtxfQP11zF84yN1/2Z5jAt1Bk5Pp
         K6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOeQQneh/iYZxlFtHSy3pscxJZXrWNykjgse5l/7qTJyiXdZIIcoSNrDH47jPt0pmDHrwJ@lists.linux.dev
X-Gm-Message-State: AOJu0YylAfpcg8QC+zT9kjM2PoS5OM6Aprae9TY4fqCFvq/PBkxINmC+
	2ENGwD73mQ23tG6lWIrYy7lMqk9b9kpBDJgo/G1eWmZYvtckabwDfNbpSRik31/DZg==
X-Gm-Gg: ASbGncsofPj63b/ee8tsy0Yb1A/XDdET46pqMmXapX+49lrWoWEDpnVvQI+hZKuh0jg
	gBt1FXB75nVWr0vIEP2UNueiemwZOajswiNbgaTOuL/WSp2wlMuZfdQiWPswnVOxSwoDcem3IS1
	UloTwS2ccEEAQtXH7gdA4VKG6rGsrmqFHW803zn25YtuzXDp3cseY8VlLiIo2q9CPh9BOWeXsAB
	94ou35Zh5x+BFhOx3rOqRuOL712jGA2NYa+NCAf7BVcQAf4F2NOowdWtBTeH1en+HRoy7vQ1f3k
	2gRyc6KwcwVRIZ4ua/mhTaFuCD4w0m5FI70T9B8tOfRREGjZX7Nl03EKcXrf3uDKR8sW4ziVqTB
	tfMIVOn51bIuhkf2k7v9CEUOKWtdS5nRVbW3WQlf3zcT7bQF1CSw4zeIT70XJ5M7SLzz4NcuAzb
	/xsEDfR6xaVRbjfWDirtU=
X-Google-Smtp-Source: AGHT+IFiW5uuUfThNCAE5E5ZFgpL6m05j9sNEBA5KdXE7U5W1B+ttFi3OD7gOKI+vJdjrDuPcWhiyg==
X-Received: by 2002:a05:6e02:17cb:b0:425:8134:bcaa with SMTP id e9e14a558f8ab-42f7c2d49a8mr17910315ab.0.1759793991149;
        Mon, 06 Oct 2025 16:39:51 -0700 (PDT)
Received: from google.com (138.243.29.34.bc.googleusercontent.com. [34.29.243.138])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42d8b1f4f0asm57563385ab.2.2025.10.06.16.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:39:50 -0700 (PDT)
Date: Mon, 6 Oct 2025 16:39:45 -0700
From: Justin Stitt <justinstitt@google.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v1] perf build: Don't leave a.out file when building with
 clang
Message-ID: <csrtenswfduvfgyalcydxudcwjo7ezt5vuvfxkkrbpza6o3cls@t55uhpt4363z>
References: <20251006222116.3335193-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006222116.3335193-1-irogers@google.com>

Hi,

On Mon, Oct 06, 2025 at 03:21:16PM -0700, Ian Rogers wrote:
> Testing clang features doesn't specify a "-o" option so an a.out file
> is created and left in the make directory (not the output). Fix this
> by specifying a "-o" of "/dev/null". Reorganize the code a little to
> help with readability.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Tested-by: Justin Stitt <justinstitt@google.com>

> ---
>  tools/perf/util/setup.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
> index dd289d15acfd..6caf2126b1cd 100644
> --- a/tools/perf/util/setup.py
> +++ b/tools/perf/util/setup.py
> @@ -22,8 +22,16 @@ assert srctree, "Environment variable srctree, for the Linux sources, not set"
>  src_feature_tests  = f'{srctree}/tools/build/feature'
>  
>  def clang_has_option(option):
> -    cc_output = Popen([cc, cc_options + option, path.join(src_feature_tests, "test-hello.c") ], stderr=PIPE).stderr.readlines()
> -    return [o for o in cc_output if ((b"unknown argument" in o) or (b"is not supported" in o) or (b"unknown warning option" in o))] == [ ]
> +    error_substrings = (
> +        b"unknown argument",
> +        b"is not supported",
> +        b"unknown warning option"
> +    )
> +    clang_command = [cc, cc_options + option,
> +                     "-o", "/dev/null",
> +                     path.join(src_feature_tests, "test-hello.c") ]
> +    cc_output = Popen(clang_command, stderr=PIPE).stderr.readlines()
> +    return not any(any(error in line for error in error_substrings) for line in cc_output)
>  
>  if cc_is_clang:
>      from sysconfig import get_config_vars
> -- 
> 2.51.0.618.g983fd99d29-goog
> 
>

Thanks
Justin
