Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830414A1A
	for <llvm@lists.linux.dev>; Thu,  9 Jan 2025 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412383; cv=none; b=Cmtrl4f3bBUE0L/VDFC6WG7AnZ3eGsloxypF0nPjNVvFOXQADLNrMDBfAqgUPPv935+LLyfoviV3Qf54znAbGZSdsI5QL9DdGd9B8fXJNbSwYJA7QvRe18E7zUtswM7NYvB6QMWJlKC9CXF7aOudTWxNOpi+EVpePRqhdI7AZog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412383; c=relaxed/simple;
	bh=eWYNxw22dlFCgATzM6mV5kTwq+fuFqMkVkErigCE1tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3iJuQvyXWFIx3Byh68JKLig/tDXFeSSSNTuxSWWVj1tEfdrDwDhNkmlZPZowXg3nQETeF+9tmcxDz2j7jy56zsiTuo4iV718jroyw6HOkwD9SaufM3cdnql8/vhlaPLA4tKtHcNSwWvru6cS7GLQVPVYkuoPC7ESdDjIVLTJAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C1XknM5k; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C1XknM5k"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e3621518so341386f8f.1
        for <llvm@lists.linux.dev>; Thu, 09 Jan 2025 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736412379; x=1737017179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aT6h16XRgOZytfcOtsHfB55s6clvjsMb3AN4nmtAEpg=;
        b=C1XknM5kzTDLIa6hglvchUFKKlTocULL5S/LLk6BRSge9RsiS6gYiwAMFVjpuqeRwP
         SNq2ut+hjHwAeFT0PNHh+DzRrJPSkTF8MDpPrYTr0hFOwm3xbJ2BQvevR0LRuwF3lPLI
         uigoLp0fXvb66t170Cx7fUwyP9nNa3mcujYNZ9wuS7VMsEL1YPmex+dIJn9PpDFRIWMK
         upE9y3OydNMRlNysvAIyRmUAWR5ejAwl66FGfR2RIaytrX2lkDhWsOKw8ZzsXM+ZCwCm
         tpKJPuMeJvfN/fekohsM1CtwD6V4X4tMJthXFuvzEo1O5S4pt889x/9i5LRBhPOrgYnM
         P27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736412379; x=1737017179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT6h16XRgOZytfcOtsHfB55s6clvjsMb3AN4nmtAEpg=;
        b=hquQXa6wxRuRY+MMAp6z1QYpHMDvc1eL+PHK0rR4qjy4Jwmu58WHe5zwJze5f0Osgh
         O4Bvu84AYGD6J9t2fpCfIY/4qA8dVHAmEI70ImY4AVaLSZG7WZ2O1zZ2elH7mfhGQqdp
         uBSBD1ujCXMa6wb+trPmk9wsCLGnKmreNn0dR88DrqomJFR+71EQvLnzp6HfWROOiH/2
         14UDYDRMOMfMF8kNIfW7PCiXAw8M/Q7LGLZhLTaqcsjv1zQQxJXF2A1Tbn6GRwNqoR0i
         mVQnqHmfRsLQpSao1YJwEypDoq5EYQhJ/1lb99jstIMviHPZBeBZBIeriYkUuTOSmdFg
         m/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUQkp9ZRZL+jed/rYG8BX33aRYNA4ExYbtFkmgifKKT91c6/FcWoEEAxG6ZLxBTd7lszmwx@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh0goDJ09t/21jvswzfoGtGgZAQVdUDWb4O0BY+jY5naSMftNI
	qXB5zAhDp6ffUD0oujXa1NGKs17bAZvRla3UujkC/1F0aP+EzKYULyL9gP/JJ8M=
X-Gm-Gg: ASbGncvJfUwLoV1U5gor3Oj4DRKwYztg6/fawsBgJ4tgBJ45V7saOaceDMSDw4kGAjf
	YqL1vp+suh99jE9PHfeYxEtqPjGzSaYWVWAEojzYIVtQO0ORJpiFBuo5e9mLHWS7URNB8mwgl2R
	+lhH0dZSsNgeocmxaH6sSJgVjOka/wAne7nXS+Tm7TCM9TEpy/Q4Cf83kuF+vAYoBj+jRE76W6i
	Jt6PrVbwsNKi2mr4gIXCcjssJsyK3I96po6AMHA2rANJMs=
X-Google-Smtp-Source: AGHT+IGSdbhxVCHDC3vLUUMrjAIP9JM4UG/RcKQTMKms3Xt2J5RXb7IyeybxZB64334rg0W1LTjhbQ==
X-Received: by 2002:a05:6000:1849:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-38a8733df9emr5690120f8f.45.1736412378954;
        Thu, 09 Jan 2025 00:46:18 -0800 (PST)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d007sm1174655f8f.20.2025.01.09.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 00:46:18 -0800 (PST)
Date: Thu, 9 Jan 2025 09:46:18 +0100
From: Michal Hocko <mhocko@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <Z3-M2pVQHCqWZhZy@tiehlicka>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
 <ZzsDEvJn-vauz9gE@tiehlicka>
 <20241118092517.GE39245@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118092517.GE39245@noisy.programming.kicks-ass.net>

On Mon 18-11-24 10:25:17, Peter Zijlstra wrote:
> On Mon, Nov 18, 2024 at 10:04:18AM +0100, Michal Hocko wrote:
> > I do not see this patch staged in any tree (e.g. linux-next). Is this on
> > its way to be merged?
> 
> I only now found it -- it doesn't look super urgent. I'll get it into a
> git tree after -rc1.

I cannot seem to be able to find it in linux-next. Which tree is this
sitting in?

Thanks!
-- 
Michal Hocko
SUSE Labs
