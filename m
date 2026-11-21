Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795243493;
	b=YEzuaDB+acxX0H674LA+cwk9QmzCfyb0G1/3AjyiFK0F3dFqOmtfzO9tGEKNr38JK0Ue
	 GnjelsGNhAqKKGR6Hp2JNJvnWo8SyvwB8Z9FAzGK25f5/bMZfKZqr5XlpKovSM6Kw/BU0
	 aeKRPobg3OVu0Uxsg2RVPw8HlE1ZE1o+beXwXBdPZuQi8aTcqyF3tbbmvlnzNjfnbpyd0
	 TV41meNs5fc/ac0clN90JmKsyDcTFvrBTavLYSS/KnqfYdo3zgnRcerJoeqKPjvBTSGFl
	 dX5wT/rFt7umS1Byl3nu9Sw3RKFUeZ424CDm/+BjNy0Rimk54QVnNMrPVOGaeNekMxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
	b=4rjlphkYeZ9qKVTqecpvIP1NTzuD01GRpmg17GbcQ/bAn7ntwM3JM5JYeqgN4I+N3o00
	 MHxmJyAmXlRSI/3iuBrBg8SDgoIURCQ1/sz0AsBvRG+RLNMkp4Hrei5GoVR92CDmwq12N
	 dWcNceXJwghJwf8DIHl/V2dVRnoCC7mYoM9K5vKGhYEhJ9qhoS8p2gIal1woNPFKEZi7n
	 ajm38ZQRqyp3+zFgh/PZfWKxklWmRD1mpVcTkpITHjXjtssK18j92cCJqrEAO+OXLYRS7
	 KBzVdfMH9n/Hm1VwdW2d+MlI1Qiat51yW60QrAlARaV+B5IGfeHPuhNLNrDJVYgIDyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fQYz3NwS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31EF606A690
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31EF606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fQYz3NwS
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55be673e029so80161cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795243488; cv=none;
        d=google.com; s=arc-20260327;
        b=QIxpDsdUCEzl0EtgDqxOOflOg6+PWsYDrsdWolvnqcWT4rH9c2cK6R8INCsO6M9U1S
         rE5kwpaXKW2Jj/s6u34qCfYpqco5SdxZSF7brH0UOQpypcEJtcX4RSn7+Mau/+NO0EDW
         y0ndRvh8IE9TleVXG7EZpcevpB0Bk2tUrbxuNRZV8zDc+vq+yLylPPW5EmA5egQ4uCiU
         1ncOx0UBz0afTXsr9/qqJii99E4UYVGI8RNaQJMgNWp2gN5BBLT7k4gYOl/iD7CVCWiM
         qPir8k6xDkZ/PGWs+xRgUyPP4beJ8oydv5u9vQGhgumiF1iQ1tUGdvI7hxKnhojcwWTU
         mA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
        fh=hvATzx+eMOTw/PpbHLkKTT2lPaKMBEDOeOlD6rSdg0M=;
        b=UGzfIRd4TnTmeDSowre5kkKBa1Ci6xIF/IEF7+Xcvzs6t3ZYIqSnd3YXTDQNvgedqC
         6Ewmb9mWyKkcMsbYaLidGmkLTj4LJ8UAQO1Jq9dHZPyF4n6UwpTokzI6KxAe9Tfs3TXc
         rOeheIY+40iOcygDAjeDveEZl5FhhWqEvfHqS1gpOx2ijJyf32FTVPp7bUYqLPOAPEW4
         h5hsrPATmpNjarP5J4+KZYcrYVQ7yDdl47y8j4oir8ka0Ks6Hj2SMXUAHkcdqMFGO8J+
         CKa/MYrRn410npz07VI0OuC4LUupBprV/Yq4mFvwl6OB9b8k1yCfhV42vmB7zZRjwRO4
         F01A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795243488; x=1795848288; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
        b=fQYz3NwSPOQvdpcQVA+sq37WDVeGSDrBCvha/PVx/kN2lNyuCH4wl73m75jMGrCVvZ
         2a6gQxmCspCkapM0eHfaXIZ67RcLkfViy5LN8PXFqzkzzpYgUfzxOvdzGMXY0Kh35bWp
         7s5MXFt+M2zgyslo6MrzWLyqa+mm+bEY5DB18UNt/84GoS6uGe6mjiHktO8yK5zLaz5N
         OgB2DoYThfyGi14uvPUV9k2PCh2K0vZcYHMAAkoMkcv/qBXgniowKosBAjnLoDKRnEpS
         EkBneoDmngUc6Xc1rFb68tHRlqVf0/pVFBDVaJH2zUko+bT0WPxiEEArG9ig0mFfhPnS
         BwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795243488; x=1795848288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJGaXCKWewK0o1WODe/ahcxjTKhVHE+pDRivB69i4vo=;
        b=i+v3X8H+36agDCKdMf3smTBkEDbJnENM4w9awPKkREkqLFVlutmFkyRag2fdirb9p/
         58a2ws2WmqhPLbzVdFo3lAkLSaM6PE2EiUp8f41XkPzM+st5BPxPhmayEvmtDI+OY14W
         BHaHkm+1+6pWOYAL3CjojMrm76gOeN3hbRuhyQCpHxJmU2N4eoxvD+7MRDjcR3wKPRtx
         wBEXc4XbsKgp63M0gBqkvpOMleZyyNT9krPQ4QzzOKDjs8H58pDlutknzarPWKqajnuf
         PVesNhNgEqalmq7eoKQ68mz0SRKDfjfkwznoRngmwc5Ez7KuT74BSpvAsICTWj0G8IZ2
         nNMQ==
X-Forwarded-Encrypted: i=1; AL+hErHrUASVpL4K/UJnxllNhAzvjI4WofztAHgRbodG3Us8kUTm6pmdYm3D7An4IXzVkCkjXmQO@lists.linux.dev
X-Gm-Message-State: APuU4Z94VhJQApfo35OIGNhSWYMgO6ljQWWt5Ay1DS3bwWZFeNge0MyH
	OJuydFWZgOOS+GL5A+HqwTSzZpC6Ps3WHJzWPH9uXx633qD+d0ZRYrH+n4Z5WIbtotuDh3MSJTP
	QR+pa2OGpYRwDdWOKjln5lJ4cF7+U8oXDS9oLtmsK
X-Gm-Gg: AZFdTZf1DDTKNA30cqUyKFIZqZcIq5GDoT7TwjrOkgi8F16BYf98sU/Rnj9hx16ccaU
	LeEQ1kQTqYdBXheuUpieD/jSmS+3V2/nmp/XsGSDuXsBxRj456vOxqdO1T9gBip2I6Vgcol2hV9
	QNCe4qgjuYcJ43Hfn1dhDpycCt0Jmi43lUNhYQ0YN+89N135LnG22Bxz85GN3L65jxBMVWBPIi4
	V78mWBkmI8/1QR8N5WCcKT7DFqWtoEE4uhqJw9GcuZaddNSjwkZQpqQhSm20rnfbFOFdwk9lASS
	BRDZkkyh8MnU21+6l7n3/+julVc9zyn/NE2pRfUoR/ng+thpQ37m0rJNwLVxKNs8TNMuMF4YrtM
	ZZVVYjlLxgJ8YVBFlunUeIULSAzhUEbQd1Eo1
X-Received: by 2002:a05:622a:2b44:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d88013e93mr11498761cf.2.1795243487193; Fri, 20 Nov 2026
 22:44:47 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com> <20261113164152.2095566-6-irogers@google.com>
 <av_aLv6EpM9Umko3@google.com>
In-Reply-To: <av_aLv6EpM9Umko3@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 22:44:36 -0800
X-Gm-Features: Aa3M54o_O14Zh_JgQcHXrC4CBU15axyWAwszYpzIdNObSrbntvtFzWqzUehOzsM
Message-ID: <CAP-5=fXj-43JCDZVhY_E=hEQ=x18aN1TwsE4rKXFX7tfZdzCZg@mail.gmail.com>
Subject: Re: [PATCH v13 05/21] perf build: Enable additional Clang
 thread-safety flags
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 13, 2026 at 08:41:36AM -0800, Ian Rogers wrote:
> > Align tools/perf's Clang thread-safety flags with the kernel's
> > scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
> > -Wthread-safety-beta, and (when supported by the compiler)
> > -fexperimental-late-parse-attributes.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/Makefile.config | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index 3eb8d095cda0..b50702bac53c 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
> >    endif
> >
> >    # Enabled Wthread-safety analysis for clang builds.
> > -  CFLAGS +=3D -Wthread-safety -DWARN_CONTEXT_ANALYSIS
> > +  CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
> > +  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-=
beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
>
> Is there a better way to do this?  I think there's something like
> cc_has_option but I cannot find it.

Good point - tools/build/Build.include defines `cc-option` (via
`try-run`), which wasn't included in Makefile.config yet. In v15 I'll
include tools/build/Build.include (updating TMPOUT to use $(OUTPUT) when
set) so this becomes:

  CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
  CFLAGS +=3D $(call cc-option,-Wthread-safety-pointer -Wthread-safety-beta=
)
  CFLAGS +=3D $(call cc-option,-fexperimental-late-parse-attributes)

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +    CFLAGS +=3D -Wthread-safety-pointer -Wthread-safety-beta
> > +  endif
> > +  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c =
-x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
> > +    CFLAGS +=3D -fexperimental-late-parse-attributes
> > +  endif
> >  endif
> >
> >  include $(srctree)/tools/scripts/Makefile.arch
> > --
> > 2.56.1.703.gf848ed807c-goog
> >
