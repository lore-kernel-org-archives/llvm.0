Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587712;
	b=wg/HfX1VffuCC/vTGJ5nab7uu5mVfG+cUwsWqMNopTpC7wEOGhWdFQSoLwbOcAEwK4vU
	 7vI85LZohfPIfhK3IymrnOBsOhHKdW0HDqMYb9O6oyFbjDmtb2L+CV3fJrBCYE/GyvW1I
	 +syNMFZBcnKXamOGIk7Ies+dKncYFqFc48TZ3g7Vftlv1vrg2cbpEA1AWtJTZkXayWiGQ
	 i1iuAxEhIsyPkjYPwsqsE9Q+uc39waYOY0JdnC3q1XyobLDAvbk2o0mGmD/PwtDmhwJKL
	 ZyGOj1M1OPp0L5oeezesRUbg6PHUmYyyvb1L2C8/I37ca55Z1xiPOL4sWWXrXjILOuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
	b=WTap97QNA6PgWdO0aSkKQkx8W94Vf/EZD4p1MVHntqaTS+DPCPENXZiXzGH+WK+Qp0ce
	 e2VI7S6kZRNlgqllN3vtqBKaACjfDd1WuQex+M4h4XsAt5Nzh3yv3mxI4j4+7vs7YNQ4i
	 E5IMAallRUdT8sSeGfVWbkkIGXcfEj4t1ilx82jiUk3sHaPSsLaRycfZ8PZMVYhNxeQ9F
	 rEeSSUt9udaH2y01/uYBCk9RvFqCNTJR8/RnPuz+XGIMrQDGbdxFcr9c7tc0mBc4vbnat
	 0/QiWPHhN93akI+CIXogdf8V4BsexdSWgDun2PBH1iWer/O+IHUVhOiBKnjRu/Q3MhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="f/laLNfm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A91606A32D
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A91606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f/laLNfm
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-54492d8a988so458791cf.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587711; cv=none;
        d=google.com; s=arc-20260327;
        b=WVW/vOG49cCQDVXgjjizk3Ztsmthe2M9zB23OcoPO7K9czH99EiJjFEA5+LG6vkx4K
         ACQcx6/eG+HQuKD//GFdssqI56Oo+Ub9NQWmDr66JBuR9NMXxcH4wsHDky09ZHUDuaTG
         S28imbyrasVJgkH1wiw2kBCffI4me6/sL7e2oK2czBe9+nPAUUqUELsKyBw52Em0SMh/
         oNVXX0xg7SForQG6RwHY6QLFrUUhV9JCB6EBxuzfweZOZUAUUSLisY0+BctRnkjnV0+P
         adfYwbCT5mhNEd9R6uZPlLIt8AaJ6o3ATkNwz40IIdwJLPPPJgoYicZWKCikgmI5EUdU
         TyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
        fh=m4xQPxTWW/wqVnYFgzNX6wkEPS+fv0ti0Ij8KVpkJ5w=;
        b=H2AmFrJi1I32lHpaLuWHkB1B69paAqJtFMKQ38Lc3fvXoq85O+R99AMwUrrVJEyb/i
         J8zvpvRWNlKuddDkeY/ZdRd1MwkEKoHXDGP5HaRZo2eNoReXFRzCWUtolX9ANS9ZFpGO
         wult23H5ok+2HVQuxVo+NxMZsVDVUfwouZ/zTn9sCKs7rbGMFpr9LcgHpYwg4jbCd9pF
         dPbKCJcmUCMAlLdghR3PmGVnNqsCkoMFVhPAsyHLSve6l5LLTmSqqV3TWoefsVx+Hpgt
         igi0TKKPG4f/q8Hoc73DJ1gOrrELMSgN0bMCkB1lfa7yxzSWHIfcXQDTVJrKRavvmy/m
         i1Gg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587711; x=1795192511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
        b=f/laLNfmszv0aBeR78QqbuHc7eiVtrtgyxAyMiltR6sQbZBG/XPfbNjjuloonwXr/4
         cWHrakT7EiPNfdpcqFAkCrcLg2WZoHK8AqHlWL3w9arykLVNnmDT5Ky/Cj2XoMJK8Aei
         u9xht+3cWa/nmtLpTdElIsYgibaAlCjxOXh8CWyLQJQIMjPLkfi2dWc7X5LsylBwx9V1
         wWvI9YA3ypInkOM4wkqI6wku6BiBGrgK7HWid22Ov6YWucnpMmIfdnCI1cD51xf10omf
         3FqXHlA54RI7h3qHNVCqFWdy+6cw8erjb0rQicxFqAACk6Fa4G6a58tWDqpoFbpzzRuz
         Cwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587711; x=1795192511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrD29yEt3//vypzd/WFZNa9lHxGVeY2L/1gSF8kcYKk=;
        b=nmSZOQYOk02rPmxajktaAE31Z4dU+Mug/7xCk+Ztsqqq9Cy0/5JDi2bphtBGv9Jacu
         96dKETv5/YW7wdleQpZiFgJGQ5X1d80fas9sGdxFa6ji9rQ0h1ck3HPJCaoeqFlV9suE
         ickNQwLKdcC7tJAV9QQcrDC1XYtvyALZzsCZsl6U8mN6rzgVWwzZBS0CqUKWcN+JuYXy
         KpJg8QuxTuVe4pKjPUOTGx0y49gX1Q9dleQGAsxehAk7Tpox+gvhacQNUrJUCAuH8kac
         bpbfZrMjOcv+15S+JTVCD4YefkzXfXswottk5PIvwiWLlqjBHAhMSNAxB7bBxzo5leIt
         bumQ==
X-Forwarded-Encrypted: i=1; AL+hErHyj0RXRQP/ToyQ20D9D6EqGcYqCi3I7jJZprBdya0txHwyUkpfQLKkO5H3TXvrOFh8H4su@lists.linux.dev
X-Gm-Message-State: APuU4Z++7toaL70qsEr1wAH55zVskrpmLULx2c2YniwSSlhhD0CHIfrE
	1jFJ30viZXX/r3uHOlWh0wvuIJ9zLuWT915ZvUsrJfVR7QukOxFSaJVd3VWlS5NisJ8VGuO8Otr
	4KOOike47CXMGMj2+Qv/qdlwAhlznpKIQV933RzyY
X-Gm-Gg: AYBFou0PoBpmf6JrQeo5fQcc6sAgZ4gPRUpXIyJogCg7bsZKnul/wL66hMLuaM9B9Q6
	EezUtlyCe4myRWicVLC9WVDLRK98DqLafimKBUeuwFh+Ome+31o7b/YYiIeIj37u7O1AzBhuvRC
	9bF918Bw6q0/5QA7Qx+WMR+RFxT/OmgzUpzKbpfAV1OAeGlr32IYfcLQSAWLTNtTAXvh1Q9VZ4T
	qJFQekFiowIMPz/3ML54ySf6l4hFdMk4g5GLxIRFN0MF6hxU+b97aIFZeuYr+8j/j7+deLrLovx
	jnzpiXDiAsE6I0A6gvtNlaL8VyYLsVFk7x65QF57rDNl0156YXVEoVx0BvlHhDVN6yEE89e6R6J
	/zFqZTzzqW/u41Enp3qhn7dAIDsn3lExIzJEU8QpSQ+HbbeocG8y+KjkBckZAVghbKJs=
X-Received: by 2002:a05:622a:1ccf:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55bce7e113emr6611301cf.12.1794587710393; Fri, 13 Nov 2026
 08:35:10 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-16-irogers@google.com>
 <avVoe_hajXqJpfmq@google.com>
In-Reply-To: <avVoe_hajXqJpfmq@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:34:58 -0800
X-Gm-Features: AclHuK_7fmidtjnY23su_Zqg7HL7UTKU7Xj3J_Z1_BDHCkhGqtFv7HpxmgYMpYE
Message-ID: <CAP-5=fV3hTWRH3B=rZ9LQeubu2mb+caXyQxdRtAfRtYO7PCA6g@mail.gmail.com>
Subject: Re: [PATCH v12 15/20] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:19=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:07AM -0800, Ian Rogers wrote:
> > In tpebs_stop(), read tpebs_reader_thread into a local variable before
> > releasing tpebs_mtx to call pthread_join().
> >
> > Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it
> > as the thread argument and setting tpebs_cmd.out =3D -1 in
> > evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
> > by perf_session__delete(). Also reset tpebs_cmd.pid =3D 0 and
> > tpebs_cmd.out =3D -1 and return early if start_command() fails in
> > evsel__tpebs_start_perf_record(), as start_command() closes the pipe
> > internally and may leave cmd->pid =3D -1 on error.
> >
> > Serialize tpebs_send_record_cmd() with teardown via tpebs_cmd_in_flight
> > and tpebs_cmd_cond, newline-terminate control commands so consecutive
> > writes cannot coalesce in evlist__ctlfd_recv(), check
> > check_if_command_finished(&tpebs_cmd) under tpebs_mtx only when not
> > stopping, ignore late samples in process_sample_event() once
> > tpebs_stopping is set, and guard evsel__tpebs_open() against a
> > concurrent tpebs_stop() with tpebs_gen, tpebs_enabled, and
> > tpebs_stopping across closing the fds and finish_command().
> >
> > Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, an=
d
> > <unistd.h> explicitly.
>
> I feel it's too verbose and not clear what's problem.  Please explain
> the race and how it fixes the issue concisely.

Agreed, the commit message grew unwieldy across revisions. In v13, I've
rewritten it into two short paragraphs summarizing the two bugs (the
tpebs_cmd.out double-close/leak between __sample_reader() and
tpebs_stop(), and the unlocked tpebs_reader_thread read / concurrent
open-close teardown race across tpebs_send_record_cmd()'s unlocked
window) and how they are fixed.

Thanks,
Ian

> Thanks,
> Namhyung
