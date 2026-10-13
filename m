Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4785550DA1
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932399; cv=pass; b=KmQTwgHyLhhjNz5NUgO68CYFpLuGF6HExXvqEXhYJCmVcsDrDdJhafzMRLP739Ny2B/N3Wn0QwMUnufdw2wNa263FJy3IQ/2HXd9S9mHGS4l1VBPdsToPqYk7cl1mZdYjSlkUn5Kjbr1nhaHE/EU+h3ZoGsUKkSuKvwteB0UIA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932399; c=relaxed/simple;
	bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWyfLZqIYN0eSMpukt2bZRDjKFprQwi8rgvhb3TmDAVXzeYKSL0fSxjmnHvH7IDXHhPNGU0t0aPHAf0ifZbqe2WdVgfa3jZFMAEtNU1JFeLVeE6PJot4n1VUUMhp+rjzv1Xv3WWkjHSh48DWZwU3c6Pflp3a7FXUBiqysHjPQx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PEDKKuzK; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PEDKKuzK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so965691cf.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932397; cv=none;
        d=google.com; s=arc-20260327;
        b=R57vwb7qs5DmEbtbpt88+HYjl2y6xc0GOWLbpXpIhRGJRWVj5DCgEbPOgzDzXn2/Y0
         h9zrju0UBiUVBEp3OZ4FE/hSXbwmJFtLe4aeJcLSPRfpPE9YfWACenb3eKJt7ObS33KH
         hCiONdk4PHRRqfRK0YPTc+ZIQS2LbugSFvKR9sys78+7nIAu1B0noVlmWtJMbj8/7YD+
         byX5UqPLdvRfPK7lAAowhunFlG5jcEcTR06uUuGlP/ZotysnTMm51D8Dt5f5oFVysm8W
         iQZZYsXBKOMgcGzrROsfTedc/MKzP6ZUfiZI2xDNMADNHji6bt2jszdnQ/MvnQTLXXyr
         dOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
        fh=a9lqiPw6YQ6LUMwyevbUcuCrQbyKNstYtbqjJL0owyM=;
        b=nliJQOaEPEFhPNz/g/HzzHe3NEvjGiqYLcB0M9/YjpKKLdqVypcv6fj1bBiwcO0Tjt
         gEO08nZKwtkOlIq5HmD3bY3oABwl0vW6f0DZjgsrG3+uHYq3IW9plyRLuN4DCSV+O1fP
         /OBq+TRPPxNCVpcVBtR5Oc+CdjVKa3ibwjQaDv5fouHHhFoYpI436ZgBw/D9Tl0dkLtv
         yURRq23tIgDSLEm4KyhOvQSzAwIMKbdJp2WdiIjmiR36rCaSTRNZ125trwyrB5mGiTYG
         gpedQvzYEqyWctrs6o12w89liHWZdpnJuzKaeRWDHYR5Hs6RtrAwrXyc7cqSxp0VeTfs
         hvtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791932397; x=1792537197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
        b=PEDKKuzK4XkrroGe1MrZ9fGzuvdk3o+wSs5oVNGRRx8AiiVrvGnRroGdv0L2jHkOnF
         Q8Cv6dYqqQ0RW9vkKrF0q6NzM+cj/fm+5imrjL/1TkmUKJW/aYRthSr7KfVMTqv1fV3E
         tAOTWP1z6/UWwA/SfOBcTS5LresUq9SMTuD60Or+VtuHPKW8cCaVraLo1/VZctRFCqCx
         d8+U6b/cEBiGYuKgAPSJvQnG/VjKGxbAQjWLZq6IYndTAq1jGO8cn1wFw73HfdHsbXLQ
         kdngB9Z+blEnjG7CH8QxdJUNbTl9yV73WRKr183emXOMgHjBNqz3bvItt4lFu1HyWtey
         zPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932397; x=1792537197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY5cGd/OUwl4SOwi9wDO6hb1GlEWV5WxOS49wEMl6ZA=;
        b=kgg+E6kHUSCcUNEjPwvFbwnZdd9ixCy44XUqVbSxQoV8Z+S3oNc7i4TZFSCHdg9MpQ
         NLwg6Zllld0PnhO2atOuv7aqgA46dH/0RllFBDpEeY7pnNMBN9xxau0rWYUJq9LC6aB6
         4sXTuVg45nH/xElOTQhcY7x03FprCuvw61GzxHR/QYcQt4j7/kbDJnYt5BhiXt14kmDV
         iRrZNEKhLwE9HO1XiyXMXH6XPlsm8nxnFIyFH8r/tYW0T/xrap5yfEK9dCBAwPZ7cZ7b
         NrrU1RMpy6TeVByYIPIVzM2Xo3Lw3r1WiAMbPfYCWG/k6IIH8yCDxXFpiWtigp9HwtIR
         MhbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbRB4Ransidm/6+pdA6NG0Kbew9iyQb4N4waNfzc67VkgHcGKuX8HHgRkC8KzUXG5PsXWR@lists.linux.dev
X-Gm-Message-State: AFq9FYJqgKi5xPZHJ0OKZ/yMEtRnqTZUq3FNxtJHYoEdsMJh1uGWI8Z3
	hfzC3n+foOZZ6udlsq9JVQIhXAYd6XJe8PC0UsB6oZ6V2NcSO2ryOlUWk7L0fqCRrvPq7qkhvPw
	rtHKTRLT/snPBr0WdidJOdYYb1sjuoOrYODtIRrGU
X-Gm-Gg: AYBFou07xJV8y3LZH/GAivGQl+WRtLu5YHfROU81k8e6Mw3/s2vqpiZniRk3I+EAqDK
	grKyGvYx4U4kUNI+4cfZ6fUYfzrVx+nVwEfkiq9C38p9l7yxeFaO9QbJmugZ7iuRi8ZyFZ7OSoJ
	ERhEZAz01QcCb50B/TlBnut2imfXFo9WCgMrPgx5fb4TOXP5q6LfZPkmZrJExde04D5UTo6rzfT
	ytxN4XlCLiUdSgKcWHmW/aLJh8YdYBDTHZfgb4ajbSUbVdlORQJ3ARUXNruU+OLL0MWCNRbYunv
	Roaap+2R7FXpSw663OMwi8tLIsIjW4cFxxP3NiNkEqwZ3uS6zdDGYHcg9Dww3VaygLvz5kfv5km
	8zj3MPK8X
X-Received: by 2002:ac8:5c8d:0:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-536029187b3mr1791311cf.2.1791932395941; Tue, 13 Oct 2026
 15:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013182458.1234616-2-irogers@google.com>
 <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org> <fb2f83ea-cbe4-40a2-bbb3-bf2884ad8e05@acm.org>
In-Reply-To: <fb2f83ea-cbe4-40a2-bbb3-bf2884ad8e05@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 15:59:44 -0700
X-Gm-Features: AclHuK-lBc-qQ1WS9bs-jEpVE3FRQf-vRMZYUNnHNAOM6niBmkWu-IQ6L4u5gR0
Message-ID: <CAP-5=fW0eOoWmN7kRUhCOVKvYsGs1fvqC746_HVa41MzjcOs-Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:47=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 12:44 PM, Bart Van Assche wrote:
> > On 10/13/26 11:24 AM, Ian Rogers wrote:
> >> Assisted-by: Antigravity:gemini-3.1-pro
> >
> > I think this should be changed into Gemini 3.1 Pro. I don't think that
> > the "Antigravity" part should occur in the Assisted-by tag.
>
> Has this feedback been noticed?

It was noticed but it was clearly wrong. The assisted-by line was
expected to be AGENT_NAME:MODEL_VERSION but in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/D=
ocumentation/process/coding-assistants.rst?id=3D816d9992d9ed434ec52cfbd6308=
0d518e535a41b
it is now requested to just put LLM. I can update this in v3.

Thanks,
Ian

> Bart.
