Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3850533CC
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 17:22:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id n7so10989950plp.1
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F5WjtwkWqyZfTkRZ7Dsd4jLoL8mM3gEkTkPHRcfvo4g=;
        b=MrE3tXu8TDG6zOfhEmsInCfwvAiODq68nqtZY/yfBW8V2YVuNSR9scamB+u00paSkG
         tNPfU2CJSqy1W1hYxg3dCA2qgCm+uf3gOelQdO4JXmCxf89IkliLYDeQfhE4pLLA5q+z
         BbeFcCdjOG3N7ISAhzXlFdKMj1RyXHyxPFTfBwRzFMA2HlJPHpoQwt/e7SAyAhfkVKDp
         V2uQsRJF+qMJFBxJz9EvFF0mlAKfSa5aDXM/nhpKqyCo5hkTUTsvJB8eSVxj24RO7Gyd
         BMgXG0ZmnPJfe+nxW6oncw4cW4I+tv+rZmMbsIIltWFnwU4llLRDONowEzFS29YAOtXZ
         D9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5WjtwkWqyZfTkRZ7Dsd4jLoL8mM3gEkTkPHRcfvo4g=;
        b=It7MwDDfbz5ywOcedlAn8UOLTjJpy51BWY8rj5rsF1iBQNjjaT2Z4H8c1uFAy48riN
         lKF7ohGgoou+NsYsxozvZih59LvVoaV/iSRznNfl+AgmzQlC2zhOSsleXEDa0G4RTxSz
         1Nf/969rggaMtpI3miTS1DJPiOTsVrYfo8dnDXUYWNVbyZzKkga3Hy1MXI8+Med9zpCe
         CD5ETigySp05NYKmlTCglCQ/Ds92EqVbDyjnFBVEnVQIIYcBZfqFfmEBJW9P46YotkAr
         gXq8XixtWT/7SQkMGZEhRL/i4+cvjS7thZCH840oYwbW0CCJ5fqWrPkfNx1qedSHQQcp
         kVpw==
X-Gm-Message-State: ACrzQf1l2bSO5Hpu6lzfrKq3T/zQ4YCEztOrpwZx8tr9I7tAXnCINpT6
	+mJh8oFArOWnF/53+WRd0ciWf4le4d3/nsZ66xIM0w==
X-Google-Smtp-Source: AMsMyM4BBmpGvvWElKj1WQXEwLMvfUsq5M+DqNNScs04BxqOKDqc6btaucnzkmIMHRMBlnIjMglNbUXS3Ej00ptKpKg=
X-Received: by 2002:a17:902:a411:b0:178:9e4c:2ef8 with SMTP id
 p17-20020a170902a41100b001789e4c2ef8mr20717513plq.95.1665422550436; Mon, 10
 Oct 2022 10:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5a10dda2a06b92f040ec7a18876db4c8107b4989.1665026261.git.quic_gurus@quicinc.com>
 <edc9712e479c433471a5c6b14d3e7ede9c228f5c.1665026261.git.quic_gurus@quicinc.com>
In-Reply-To: <edc9712e479c433471a5c6b14d3e7ede9c228f5c.1665026261.git.quic_gurus@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 10:22:18 -0700
Message-ID: <CAKwvOdm9fOEEQ9cYud7U16Zgd+uahM6Gnv+evoQPjfOc13gZEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts/clang-tools: Remove core.uninitialized.Assign check
To: Guru Das Srinagesh <quic_gurus@quicinc.com>, Tom Rix <trix@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, matt@codeconstruct.com.au, 
	David Howells <dhowells@redhat.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, jackm@dev.mellanox.co.il
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 8:24 PM Guru Das Srinagesh
<quic_gurus@quicinc.com> wrote:
>
> Remove this check as it leads to false positives in some cases (not all):
>
> warning: Assigned value is garbage or undefined
> [clang-analyzer-core.uninitialized.Assign]
>       list_for_each_entry_safe(page, tmp_page, &pages, lru)
>       ^

I don't think we want to disable this.  Tom and others have fixed bugs
from this report. See also:
commit d1bd5fa07667 ("lib: remove back_str initialization")
commit 33b5bc9e7033 ("octeontx2-af: initialize action variable")
commit 8d783197f06d ("mctp: Fix warnings reported by clang-analyzer")
commit eed1a5c74216 ("drm/amdgpu: check return status before using
stable_pstate")
commit 3da4b7403db8 ("ALSA: usb-audio: initialize variables that could
ignore errors")
commit 38ac2f038666 ("iio: chemical: sunrise_co2: set val parameter
only on success")
commit afe6949862f7 ("afs: check function return")
commit d108370c644b ("apparmor: fix error check")
commit d52e419ac8b5 ("rxrpc: Fix handling of an unsupported token type
in rxrpc_read()")
commit 6a6516c024bb ("USB: storage: avoid use of uninitialized values
in error path")
commit f71e41e23e12 ("iio:imu:st_lsm6dsx: check
st_lsm6dsx_shub_read_output return")
commit 3a61cdf43e67 ("hwrng: intel - cleanup initialization")
commit 094dd0d73062 ("rndis_wlan: tighten check of rndis_query_oid return")
commit e3914ed6cf44 ("ieee802154/adf7242: check status of adf7242_read_reg")
commit c2a3d4b4cac1 ("net/mlx4_en: Cleanups suggested by clang static checker")


>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> ---
>  scripts/clang-tools/run-clang-tools.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index a72c4c7..714cb82 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -54,6 +54,7 @@ def run_analysis(entry):
>          # List of checks to be excluded
>          exclude = []
>          exclude.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
> +        exclude.append("-clang-analyzer-core.uninitialized.Assign")
>
>          checks += ''.join(["," + e for e in exclude])
>      p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
