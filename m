Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD933ED3CF
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291457; cv=pass; b=Omck3WRwljm/7rOs+iUl93qgLpKZJefA2oCbXetx/lJSJmDSw7Ia10tfrmPwC8v8v0TlEbmnUXIP6XF/oDKmS2IKEN/Ibk2Gk0cYAc6+MwEiig/p9QE3wMX61YEiNORFDmVvfIlAA8tjPW5u5qEbSgoGq58tpkpSyiz5qUvmXVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291457; c=relaxed/simple;
	bh=h12W4gqhHecsXKSTpPvVrdNJ58lXyZpHV1wQiR3jS1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CooiF56p5yaD1uHuXXqoqngQ+cexzY0O5D2PB+DJQEvY6LXgh5w6KHqH07Y0jFy6NnFzR8R9BPfY+qdstWGyaxNSTSo2BBOALc6yIRzF/CLNTroNNzaP8l2nEas6C8MjbAPi7LKFFT+0dfsXncbLtA5+0iW8M2UGiKOkiA5dElM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JBFEAjae; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JBFEAjae"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba180a022dso8755ad.1
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 08:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779291456; cv=none;
        d=google.com; s=arc-20240605;
        b=LRjoc9ntphBG2jLs0zNVW0l+2/k9FHlmzOoyw2RzY3vp5Zb13B8qlJWv7HfY4wtx+L
         qwR9lXQtSWrAM0tSw1nrXdvrlfqTIAev9xalARWeXzLMuzNzzG2PYytZl+d7q/Xf/PEd
         Xz8KBX2DIA4FGXoQFYnXdufF1duetzk6fmrweR3XfcguaDPxf2PDwJR5VJmYDDnFJLAV
         xgGK1G9UW+EuwBV3X/rvgOk9gM7RRV1cFh5UpHhUor0hWXdq1lrWO8oPtYYcx8hu2r7w
         ms4VZMtYJenr/5rNQu00su+8ro+Dsb9ZM6xNr5tdgRXAGmqlcC1ltkKzD0ZOHz0QNq1i
         iZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKQdd69TB74alB2+SuQ49zJPbGZZnJPKwOD7M+iVpXI=;
        fh=U92HAxPTWg12WMm4VEZeqHW1eIP03FP6oKjdbCK97Lo=;
        b=iFCzThz549cNJwljf6FmzUPQWqQP78zgbuXp6McsSkxJ4gXyM39tNXDF03nGtVE8T1
         /hibpGo6k9NcWiDn6dq8TJmqpKWseKFJLd7a+n0DQcqWcoI+CAKfvL5HCTjPkG5bjKvX
         Ik6Yt7ExBfuwJiiqlbFneJAWoDFixTuLlRyAy2scmi46hdPpLC1mEszmNENoTaqU/PWa
         0+cVIteEed+WHZCazvfQjR42aH7qyqyayGP3GiPEFCGoS11zmlmZO0rPNILENCzPmojW
         vOaH5eTVVZf7cG9CRl10Y9N7C5WeMqlSl/PHifA8v40i7TET1BpT6SJYPMDq4LsixFjR
         qjtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779291456; x=1779896256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKQdd69TB74alB2+SuQ49zJPbGZZnJPKwOD7M+iVpXI=;
        b=JBFEAjaerE48PyZsbD6GBhEGMebg7g8i9Yc1vi9kOfgc1XZwIVGIgPbkLzkUQWkqxC
         BkHlDt+nAcaYyFVmtiamgAOC9fjNLPfs14sGMmD9r2pHEQHn6j8I3xcydjHfwpTbPsZK
         pqcMYpRxqeJF7R+edPn2Z84ChGr2WcRvtT3b4ggvsBb23zOb4/8kxffvbx/NKVxVluVH
         0TCrHGQkliFPb1lIFSfNZFZfyX9IZhqarfKG88fGShW335IGePGnHsGBDJlgxNNfX8Pf
         BLCxPmtmU1V3yQZvZzU35jn70wakykSe/EHuKGo0jawNPghx7TiBR3ZXrnoPcQet+VSS
         RyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291456; x=1779896256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UKQdd69TB74alB2+SuQ49zJPbGZZnJPKwOD7M+iVpXI=;
        b=kxpx18NOpFyec1Ou9K4ypYZISOIaB9N1m36H1C6obOebfA5hqoM/2d1RpGZBzCAWWJ
         4K/V02zl0bJNola3t+9l/09J6cFZI1nzYrl6i+LoTdzTmm7QANPP6kCzbb1E2NVBoxag
         Ovgd0FiiJxmTFtrqr+7HlyR/Vw+959bOWG/jkKr1IpiJo2IU/sszeS+xT2Kd+XK/i1KT
         WpCf5Gx1rZBgU+N2m2amxpOK0oj+hu6DonTGq7hCMHnKFp99EEtEOmroJGE3SZfg623z
         zfJSuY5j/9R+igSoC9vCv2Aso2ixtSFCP6lKrTFgGnfUhM+sPXdSGIGOaDxwyIBsAFmj
         szfw==
X-Forwarded-Encrypted: i=1; AFNElJ/Piru+U2f5KVMA6Kw8oFoNhGqOLGPp5zm57wzqvg8vWZOELhC/nXdD5vLbd7TXRr83/OVa@lists.linux.dev
X-Gm-Message-State: AOJu0YxDQYKYSQGEm1CfQT/rEuCh4iJe/L26XweWHA4VDO8OxjyCxTvU
	PYdkDh8yWVR43cKFUceEy0Z43pN/B6PeccQZrrYDWqf8+1mdjI7iuMoe57rH1qsIPyebnuAD9aw
	ZlrG9YV3ZfXSkyV2Xm8dcfP45VrsQBMO2Dy47lIKv
X-Gm-Gg: Acq92OEqe339aUipjDalGRsPnVNLh7LO8YyJKUfbWYp4WRTkVOTBYu1z6XeSTm4DjaW
	5N0wFe9bFGSLGKz5vgutuOiLS7gT0tYpXKBkg5CS7fbWkCxQWbK63uCoILTDQgdqHVw5zS51Nqa
	7YCo32nBdNTYSPI2ocfk9Tm2yx3qQSVlEuqk3vQMInUwIuwQfFxDGis27b5Xd94j3aw5XsjZJEO
	PdOqGPADZ0g3FmegpprIJQSk799QyX9YwiMsoTU3KkRjom36yBa7vHLOrUS/udexQQuyBcW95aA
	MuIvP4P8aeyhL/Fx7UoF4rXEEf4pVeRVeiDEMd3me5UHM402
X-Received: by 2002:a17:902:cf42:b0:2ae:6755:a24f with SMTP id
 d9443c01a7336-2bdb0113ddcmr9852975ad.0.1779291455320; Wed, 20 May 2026
 08:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407165551.3075684-1-irogers@google.com> <20260428065432.1877423-1-irogers@google.com>
In-Reply-To: <20260428065432.1877423-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 May 2026 08:37:24 -0700
X-Gm-Features: AVHnY4L54tzzk7AaFRDYZ8jay5rkttkNPmlBp-47ET5126uZtNEwc8bgMFqOrgA
Message-ID: <CAP-5=fU9m_kHV+qKogUQhZhtguhCoxKsC051APsyQW5zjzbZFQ@mail.gmail.com>
Subject: Re: [PATCH v2] perf clang-format: Add a perf clang-format that
 overrides some kernel behaviors
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: akpm@linux-foundation.org, joe@perches.com, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 11:54=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> In particular, header file ordering is an issue in the tools/perf
> directory given the larger number of depended upon libraries.
>
> The order of header file includes was proposed in:
> https://lore.kernel.org/linux-perf-users/CAP-5=3DfUitzKwJONTngiW17XkS7kVr=
2cDS4cDL_HccJKcnR2EgQ@mail.gmail.com/
>
> Sorting headers is desirable to avoid issues like duplicate includes.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v2: Move the .clang-format file under tools/perf rather than tools/.

This change helps format header files in tools/perf, otherwise
following the parent linux clang-format options. Could we land this in
perf-tools-next?

Thanks,
Ian

> ---
>  tools/perf/.clang-format | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 tools/perf/.clang-format
>
> diff --git a/tools/perf/.clang-format b/tools/perf/.clang-format
> new file mode 100644
> index 000000000000..902b2f7456f6
> --- /dev/null
> +++ b/tools/perf/.clang-format
> @@ -0,0 +1,20 @@
> +BasedOnStyle: InheritParentConfig
> +SortIncludes: true
> +IncludeBlocks: Regroup
> +IncludeCategories:
> +  # Implicitly the corresponding header for the C file has Priority 0
> +  # C Standard Library Headers
> +  - Regex:           '^<(assert|complex|ctype|errno|fenv|float|inttypes|=
iso646|limits|locale|math|setjmp|signal|stdalign|stdarg|stdatomic|stdbool|s=
tddef|stdint|stdio|stdlib|stdnoreturn|string|tgmath|threads|time|uchar|wcha=
r|wctype)\.h>'
> +    Priority:        1
> +  # OS/System-Specific Headers (directories)
> +  - Regex:           '^<(sys|linux|asm|arpa|net|netinet|x86_64|machine)/=
.*>'
> +    Priority:        2
> +  # OS/System-Specific Headers (POSIX/System flat headers)
> +  - Regex:           '^<(unistd|pthread|fcntl|dirent|dlfcn|poll|sched|se=
maphore|spawn|syslog|termios|pwd|grp|netdb|sysexits|err|paths|pty|utmp|reso=
lv|ifaddrs|elf|libelf|gelf)\.h>'
> +    Priority:        2
> +  # Third-Party Library Headers
> +  - Regex:           '^<.*>'
> +    Priority:        3
> +  # Your Project's Other Headers
> +  - Regex:           '^".*"'
> +    Priority:        4
> --
> 2.54.0.545.g6539524ca2-goog
>
