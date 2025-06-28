Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AB17D2
	for <llvm@lists.linux.dev>; Sat, 28 Jun 2025 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075549; cv=none; b=PWcNaByiX2uk0SmoS/L0/DW5ilJcPSD5O8GtUHKU4dUuwkxBD9B+7yRB23dnMWWgZ8YduU79xQlXmLwB6BFze6BecOyoCc0biX8+LL6FyVWbWZ9fjCvRlp01Bd2bgjaLlXK9MbzeuAB9z6iIPejvOhH4IPTu1GR38icZU4fwVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075549; c=relaxed/simple;
	bh=NffUPSkbj1gfeu1piPJZyezUcJfgslp/p6HerefCQtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFB9kSEjZV6J1pfO9NQXHNGuoQQJ68RNiOaMboi7JihL4QEqa7+4ecUaxR6/cXxX/FKwq4JktFtuK5iJHGC6iaSQnfu0/qoeJzHbqrwTwPxdpevs3HRweFUz9XwKJiqJgvToQy1HqJ5uWoQhebDrQowD5KhTcr9WGmfdJwvOYyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org ([70.33.172.117])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 55S1q3WA024139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 21:52:03 -0400
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 1736E340663; Fri, 27 Jun 2025 21:52:03 -0400 (EDT)
Date: Fri, 27 Jun 2025 21:52:03 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
        selinux@vger.kernel.org, kees@kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/2] Possible TTY privilege escalation in TIOCSTI ioctl
Message-ID: <20250628015203.GA4253@mit.edu>
References: <20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com>
 <87y0tcu23d.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0tcu23d.fsf@gmail.com>

On Fri, Jun 27, 2025 at 06:38:42PM -0600, Abhinav Saxena wrote:
> >
> > As noted in previous discussion, while CONFIG_LEGACY_TIOCSTI can restrict
> > TIOCSTI usage, it is enabled by default in most distributions. Even when
> > CONFIG_LEGACY_TIOCSTI=n, processes with CAP_SYS_ADMIN can still use TIOCSTI
> > according to the Kconfig documentation.
> >
> > Additionally, CONFIG_LEGACY_TIOCSTI controls the default value for the
> > dev.tty.legacy_tiocsti sysctl, which remains runtime-configurable. This
> > means the described attack vector could work on systems even with
> > CONFIG_LEGACY_TIOCSTI=n, particularly on Ubuntu 24.04 where it’s “restricted”
> > but still functional.

What is the threat scenario that you are concerned about?  The concern
with TIOSTI is that it is a privilege escalation mechanism.  But you
need to have root (well, CAP_SYS_ADMIN) to either enable the
dev.tty.legacy_tiocsti sysctl, or to use TIOCSTI.  So what's the
privilege escalation that you're concerned about?

I could imagine some fairly esoteric ways that this might be a
problem, but if it's not a common case concern, maybe using some kind
of LSM to more forcibly disable TIOCSTI is sufficient?

Yes, we could imagine ways in which it could be permanently disabled
(perhaps via a boot command line option) such that it can't be
re-enabled without rebooting.  But is the extra complexity worth it,
especially when there is always the LSM solution for the
super-paranoid sysadmins?

							- Ted
