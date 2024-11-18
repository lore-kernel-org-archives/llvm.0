Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E6192B89
	for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923492; cv=none; b=O88IsbpHrUtMBP9hrXccJ6nuS93lKfFE8SaVFbMvo2XNizyE9CByASVqdh4+gdZdB6ayGyY6d4T6f4jl+pd/WNAsDKldDjcehSXEG+UM0GHdswStqtDq/etXHmcHvr4N6a+Wee2vjmDIBo9bhUMUpod3j/mJidtOZHIuEMqM1aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923492; c=relaxed/simple;
	bh=BHFAH68eYvi3PdLtlyTXk9KTdXAKA9Zj/AnZkMlrDvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKkMMXHIPMVmygmJj4jtTBqE8shYf3txEz73MjgFpiwYaAR1qx3eVXAvXidrRqd2Qbsl6CbI/ZFQ++qqVr3yQzUioLjWkcasYjJyxoSsEi3mWj83Up5CwSqYOq6SJUhC/Im4Mdjn5b4qKXSolheIPbkKVV+UzMJOKDoPybpnaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e8ItmTLw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8ItmTLw"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da353eb2eso2248656e87.3
        for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 01:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731923489; x=1732528289; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GTB33TPyEs/YX3y0tXNN3wmTVS6LNkgjt3Ay0YqbHU=;
        b=e8ItmTLwYmZ7dTXesjzQrIHdhb4Zs00h11aJoInydyeTcXPyfDSOws7SnVOAJLY2py
         X64oaFMuFjycijIfIsgBUZ/v3v1ElATDShCWvP8cvgZHh6Lq6phPW/lTPwIx4fEteNHu
         yJnLROaUPR2zD2Dx7qBfaCsmsbVxzqQagwHPsYYq3Psxh4QDgZQYCCEyABlzF8Z2tjec
         kGg/op/5BZK1nOnfNVQ827j5qIdhpoyDE/QYD+e67ArP8mCOGHXwRTpmLOe9fIrO9Xq3
         qLCIzsMHRK/alSUBCb1015Ikelu+uauSCJip6mJB0Qm56EaA5BdAadYIXFgaJ6vnuUyd
         2beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923489; x=1732528289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GTB33TPyEs/YX3y0tXNN3wmTVS6LNkgjt3Ay0YqbHU=;
        b=g1ONHVSuImFgBMcxDqvDs6E8Bv4Qgbwv49eKSSEz+EXy0Vu8P004wghhbkPDBVeU9K
         9DDnmT502QtAncJ5SYKiEf/iU3Gp+1UzDpe5WHJ9XWL65+oEe2hglT8sMbAiUFjFXauj
         Zn7IW1PtPrGpbakUGL9p3FCkLJyxFIZ1l/6V1Ne7NbnYxUAceQQTEze9TnLmoCZA7ZHK
         wrQfiGFxDLRdP8XUQeOB9NuaOngkMziRtCmOA6CBQzeC8qe02VlJ0vbfwhq1lunECNer
         R1wsaatduRsLK+sdF2IDlXH6WASlbrguq17YA1YRdcI/FbjUQgqAix/k8dcSNjzZvcgk
         IOrA==
X-Forwarded-Encrypted: i=1; AJvYcCWHd23nZqQDS/boQ1vjrMnaqP6Qhj+3dBNtuR7oBfxpCQ+NrOKpKZ0kNJKe8kBezne4qBSq@lists.linux.dev
X-Gm-Message-State: AOJu0YxKPcyJGjyGUAlNK0DN7MLS+fBG3+hre97y3H8pqub+Wh5v4170
	IwiCbhB9xCnyIUgtvLkoCIDK+/w4jgcXzPOR5XxVUMsYKdyW6ivUiGbTOWIVJ1s=
X-Google-Smtp-Source: AGHT+IFAGUjndOgOu4hfcbEbyo+d40bHeTZfpu3+OXzaO4JvBg5zuhrDkKC8GbHnOfHVv82NwlCBjA==
X-Received: by 2002:a05:6512:2248:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-53dab294790mr6474092e87.2.1731923488726;
        Mon, 18 Nov 2024 01:51:28 -0800 (PST)
Received: from localhost (109-81-88-120.rct.o2.cz. [109.81.88.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e08af80sm520753166b.205.2024.11.18.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:51:28 -0800 (PST)
Date: Mon, 18 Nov 2024 10:51:27 +0100
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
Message-ID: <ZzsOH7nO7okC9f4O@tiehlicka>
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

Thanks!

-- 
Michal Hocko
SUSE Labs
