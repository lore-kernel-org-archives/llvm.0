Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355B38E8B1
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956344; cv=pass; b=Z1oHaNuZISr8/j7vvGr9FCBmnRreT1liZmcVyl2449vtfeW6QtvHb9UXmY6nVDiS3zl/TmXK3tvmw4g60wICJ5x23nZYi59QyM8Nm382bPsKUWQHET0vsE5cJI7qQXGIxB08SuVSWjS0xeHaoYGyte+DMXXqXGo5LGvdVUSQCnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956344; c=relaxed/simple;
	bh=sQnTAsWHq4+55jfadbIHEQA+SgOqiqsLpP2v7YshXgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaa2x9kM76ztlbDB6d+U/v6fzGAbyPjnmR/zhUySM4N6pYTZJu05KGE9XPsGQdquBXzvd0JfZ6S8bU79/awlBh8ev3oHDUs6OrXlli5jDs7Qs87MafqIkrXIPwWN8jr4c/TfbntVTo4LyFhMT5xlAD/NAN9zFH08VLhFn0wkMDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F/6hcSkX; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F/6hcSkX"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-144f79153f5so411834c88.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791956341; cv=none;
        d=google.com; s=arc-20260327;
        b=axZVownkKESRok9lSwIGPvc+jY/LCSeeI2Kbfam5XQIL2S3aeNA6YI7AKLLBdq7Roy
         JSak+LgyJZ58IG8IVNOtRfO+SjQWigiqCwJRZ+l0UsvYQl76/tqZKnmd6s7B9teQHOaa
         LOoeYNWVK4BoBkBLZGm9srMXXelKlKU5bVQuqqequgIEMLeGa28LkN9eIUyHNYYrLqqJ
         /x6wZvC9mm+h6tEXe53g7eA1aMUODgIUW5oufgX6qc7xHEc66w1vJqgzjQyVcwHfH81R
         AMGO+Qd/CbucaGRwP2piW0EWqT1SZ3mXQL1shvlZ4uQrBvDcYRtvNf1gS8pMwz9jhCRV
         2fVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x6VJRMtY6hAHANq9F08XUEKM+7gNdB2F6gizUc3NuJ0=;
        fh=9JN2DUADToAzXLvkouLkvXPsDuzIUtam4A8B1DFdcaA=;
        b=L46ymmw68W1sDxMN7wvk62fLQOwgXO9cHvKE85uIrSFZPf3VImu3rNR8fj1gWRJ1W7
         Z3ATna7zT49kxiaKoqdvJ/jIUfjJRgiE/2E+y4Yz3UF1c6JhNQf62hLauBIHjWwmnY9h
         QBSL2cmqD9HVRW2hAt2nqUidj3Lgs7BCHiqmUgiKyrIN3TAihRW9jW3Vx952bjnJ1qTc
         8xm35jAlQgy1rWvKa68uZH228tZ2SN8Vm/54Y04T5FR4O+R0SxDrqBTD6XdB1tTd9RFC
         pp8Fnrxt6pNz8FDmJUfYKw9COJf6kWcFQylXnJvQAxY9jnjLtFG3uZC74GvOrXe+MGsJ
         1TJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791956341; x=1792561141; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6VJRMtY6hAHANq9F08XUEKM+7gNdB2F6gizUc3NuJ0=;
        b=F/6hcSkXa2tiUp70OpyD20yZA5fox4bE/I3nbf7dF0rZEzfIWihN13JyzSew7uRXJA
         unBlNVCgQ0GVerdYNk4TEoJTTPXGZI3omQg4LA2S6bX8whqSImyChCgnlJcIrIc+D8UD
         3fVbjLl0t9iBQmHgBrlCSc4D1auOo40LaZobK2vVwA7NaU2r6C/Kup3Q6j3f/qVBGmL9
         fXgaa6uiJQAoQWULoSHz7EXHR6rjIf/YixwqrLxve2gxiR+z/kbclOtr19NQ3RfD455i
         jCY+AHIbTaYhizW/QQmtig31NUpef9vZwpbha8/CxsKLqaTBfSQeId6o6cmD/NYvIWJZ
         jP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791956341; x=1792561141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x6VJRMtY6hAHANq9F08XUEKM+7gNdB2F6gizUc3NuJ0=;
        b=ZOoYv+lQ3fUkL2hE5XnNmELH2D+rNj1yr4RQlrxb4VSQS5f/6CI3o1xUuRUtQ1jFS9
         6PM8Phjt8Q2DXEDhEwuKU33l91swfanMWZwpVkVzxwSUa1Z4MaBvddnhZCXoBQXJ59sG
         D4/QRAFf6jIMlPI879ZVFhf7CvJ5r5wYF71lAxsWWhWlNqzlyM7AeXcAM8G3t65bsZXx
         OAp2jfdeC8H85k/uKbNVs+7CZIGwQ+G0jYEO4gfrlEnCnNqWv/0drPKLYvwELRpvA0AF
         woXU4aMFKBCOVJWaNb6yOFOfcNfyemm0lX3rfi3Q0LSxmuOpGxG8ZP6ARzNK+Qw01Fbm
         XVFg==
X-Forwarded-Encrypted: i=1; AKwUvBwW0dCSPg7hH7pUz6MVGsSG+/uhj35c7z/1RdP13P3NZX0vC3s9XZd0Jctdz1huL9x24tg8@lists.linux.dev
X-Gm-Message-State: AFq9FYJ7kR2pWGBs4/ezXN496fDCaDIWZFgMwEX/KEeQ50J/WEWBtpD2
	XGiSFdWgcHu1aJL2lOr2pQ9Wc8FEU/ddXo00/9o3HmndOTO7TRb6MOKQQ+f33ozY3Z8ADw06chU
	zBZKjujYN4aeSa0DdtzM4x021mrgsfQpMz9pVvYtF
X-Gm-Gg: AYBFou3D8+gZBD3Yif22EAaDOO0gxEZtSB5E4Nj+n+w1YTzyxTsuVDQXkSE21qCY+V7
	Poi+BVD19BJ/zsGNstGhBLwOYyzGy08+WAc4L/o7lRCda8kQjBT7WiSQowRHPLGb/S6R5EqrczK
	GUVfHTkvnQAAR72/LMbLaGyZOLlrCNj8wBv8xtppklXwUBytSeBvXkVGZcRW68Qb4A70736yb7L
	3ZZca682OAtpPfueHdtMFjIh18K6wdKskPn96vkclQAKeb8Qo8zQrWXojCEoArmbamk82QMWJwx
	NPjNIoD1YBxvV5LE9RC+CXexWpH3I8hV5yfwK++OoZPqWyA1v7sRQpi5qkg29Z3eh6pr+p0t4uE
	IxsXgPlGK/TI=
X-Received: by 2002:a05:701b:280e:b0:13c:d071:f97c with SMTP id
 a92af1059eb24-16a5b97ae60mr20506478c88.11.1791956340159; Tue, 13 Oct 2026
 22:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
 <20261013222622.1822619-2-irogers@google.com>
In-Reply-To: <20261013222622.1822619-2-irogers@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 14 Oct 2026 07:38:23 +0200
X-Gm-Features: AclHuK-RqXDABlGb5HhgbEpeIBMyScVO6dFeQyQpd9-tIjzH7Wv_4SxQF0fb1yA
Message-ID: <CANpmjNP=4T4pRpoiW_Y442KQbWyVtECUD3_SYs5ZYrdwkWh2rQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	bvanassche@acm.org, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 00:26, Ian Rogers <irogers@google.com> wrote:
>
> _context_unsafe_alias() does not use its parameter 'p', which triggers
> -Wunused-parameter when building code that enables -Wextra (such as
> tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
> Explicitly cast 'p' to void to silence the warning, matching
> __assume_ctx_lock() and __assume_shared_ctx_lock().
>
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Marco Elver <elver@google.com>

Re __attribute__((unused)): I suppose it could work, but (void)p is
the more minimal solution that is not uncommon across the kernel. I
don't see a downside, and less code is better.

Thanks!

> ---
>  include/linux/compiler-context-analysis.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
> index 8302ebc2ea8c..024e303188ad 100644
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -243,7 +243,7 @@
>   * alias as a function argument).
>   */
>  #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
> -static inline void _context_unsafe_alias(void **p) { }
> +static inline void _context_unsafe_alias(void **p) { (void)p; }
>
>  /**
>   * token_context_lock() - declare an abstract global context lock instance
> --
> 2.56.0.385.gd3acb90ef8-goog
>
