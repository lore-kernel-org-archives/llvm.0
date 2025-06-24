Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7862E8895
	for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750798707; cv=none; b=nvF4OKevALKZcW5VEUHM4kVAoxUQJTLIUwpH0pOpsuZkVpVKvp0cn51nz6R6GrAGusLEndXa76Z90+6c8UP0QX9EcEMERSvs4Tis4wOIh+4F5zfBUMdE8hocDfKdgPVK+xkoM/TW64t4SeXha1GKLXZh+cvQ5K03nh462Z+mYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750798707; c=relaxed/simple;
	bh=ku7s8J7NNaVRw7IojtWRiPUGuS8pNyYSGsxT4vIfzIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edc6fZIUATTqhn1xcCkG/t54LKYUoLZZst1/fN/PBdnbyJTYXrPFPAW21oA1kK6c2ZVTymwcxkCpOaQjDuleU2v0EgSo9+SNQw9/1wkVvzUd7vahixRrBSqbw4gcP3OhofJ59cIPJ9v08s0S21FIyRZD5cf/lHC4xGNx062mtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ED8gdfLM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED8gdfLM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2861704f8f.0
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750798704; x=1751403504; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zz2ubMDTUSZ3CzP5tOdKSgALba7wz8T19kE34wyz8os=;
        b=ED8gdfLMfyR4/Xg3YtFIOtWj74wcytGMVtSJz6+rNNuL4xMcEwV+orogOvzWri1gg+
         NFt4wdwlzZ7kg6F3VMxIFy1klBLYTyvWJaFCLtC+Wiy1ukFW774R7QRC5oDPv8FJSwgN
         BCHNw+VOLmLQW+v+g6YfDPDCtokNkyqa4fd8OgvYK9WxDzeMuoDDOAhuyNGQ/GbLYpXX
         OrTbyCashaz3tqqitEt66+JSKRwsZMIopXu6p69Ejs53meymbdnFx0B9TEQPdmnyzeQ5
         5vAW/MP18PXv+ao3VojVKmHWeQSzz8iNOg3nOxR4274JeZKO7HkiCmja/quMQIYDfF0e
         wghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750798704; x=1751403504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz2ubMDTUSZ3CzP5tOdKSgALba7wz8T19kE34wyz8os=;
        b=m+P0AqNmNONhK62oprxJ0sT4PTTlScUaPD1mdggscQQBnPUiviBF1CmlQYbA6eMxH2
         gAXBy8R0ZAL/k7mQbYQJ2GPBEHymZXGUfLSoMbXpDcurRKpu0pKTDThRamXWIBFSYkFo
         rNHWM4NHs8j6KQRGekL05UOUNpdO60if4I/npGvquU2j3yVCNTBulknmvb0DAAaCuHFy
         MricihJ5+EzsYS1y/2rK+HiC0pToBEtSAD6deBEU/BqiElwV79qAddvcP2XZ02RBMyj7
         7nnY/47haRNy2m8g2FsdK7gYALn/u8re8bizYOaLO1DxiAxaqk+GqCr3GW3gw+MIMtrh
         ptgw==
X-Forwarded-Encrypted: i=1; AJvYcCXp+6X8fHLTxM3cOC86LC6UCymx6VYYcFqUbvZHjN6z83g+yoAj16GU/a3KcnJPu8f5Px3q@lists.linux.dev
X-Gm-Message-State: AOJu0Yy33tRSjoZBrn8CPAlvqOpbAWKaR1R0JzhyewJXKXsqrn25AZx1
	A5lE7QpybwfblYXY6HVlM9tzNRWwp+yOgawfGv5pp1YPQx/+cXov5y0N
X-Gm-Gg: ASbGncvZsxa61+ipQfD01fOoqo86Wm2TwVsxKYVUDQpOobKi9sPCQSk5whXDCCfxkUF
	AROqmInpdOcB3bXYETIpyP+yYGigPYlqIy2bJlC7dcvu1ggyhAJIvAn5mMnrmzJezam55EwLOFb
	1TO14qusBAkDLxFeuddwITYrkF220UOUuePy6oWkgSWkp371csaanmeiVxwjlK5xBno1uvVmfP4
	Fc1ufzzx44NG6tSw19HXjPe5f4GxpnrPFmJwjRp2hUZXvJdGt3kfJks1jeXiFhe5XbHMjvpPmKn
	7vQObmfDUjdhk7vEi8Z5vuLQCfvw+Y+EK5Cf23ByXGh9QaMtorWeHomORA==
X-Google-Smtp-Source: AGHT+IGvRDON52aC7F32xyTsDzrric4VeeMtyvVJzhPR2+fqKMhg0dkJITxDSB426QL/PeWs4NeQFw==
X-Received: by 2002:a5d:5c13:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a6ed6259e5mr149097f8f.13.1750798703771;
        Tue, 24 Jun 2025 13:58:23 -0700 (PDT)
Received: from localhost ([2a02:168:59f0:1:6ea:56ff:fe21:bea7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45382373c6esm76865e9.34.2025.06.24.13.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 13:58:23 -0700 (PDT)
Date: Tue, 24 Jun 2025 22:58:18 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, xandfury@gmail.com,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
	selinux@vger.kernel.org, kees@kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] selinux: add capability checks for TIOCSTI ioctl
Message-ID: <20250624.3bb75890f0b0@gnoack.org>
References: <20250622-toicsti-bug-v1-0-f374373b04b2@gmail.com>
 <20250622-toicsti-bug-v1-2-f374373b04b2@gmail.com>
 <CAEjxPJ6v12nLFx-x4-=esuPMp7L8UBvTzoj1kkTPcD2mDKKW8w@mail.gmail.com>
 <CAHC9VhS8gPQwgesV_0VbUuqxGrADm5uDofM3m=wZuAEgkWi5Hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhS8gPQwgesV_0VbUuqxGrADm5uDofM3m=wZuAEgkWi5Hw@mail.gmail.com>

On Mon, Jun 23, 2025 at 11:15:39AM -0400, Paul Moore wrote:
> On Mon, Jun 23, 2025 at 8:39 AM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> > On Sun, Jun 22, 2025 at 9:41 PM Abhinav Saxena via B4 Relay
> > <devnull+xandfury.gmail.com@kernel.org> wrote:
> > > --- a/security/selinux/hooks.c
> > > +++ b/security/selinux/hooks.c
> > > @@ -3847,6 +3847,12 @@ static int selinux_file_ioctl(struct file *file, unsigned int cmd,
> > >                                             CAP_OPT_NONE, true);
> > >                 break;
> > >
> > > +       case TIOCSTI:
> > > +               if (!file_ns_capable(file, &init_user_ns, CAP_SYS_ADMIN) ||
> > > +                   !capable(CAP_SYS_ADMIN))
> > > +                       error = -EPERM;
> > > +               break;
> > > +
> >
> > So, aside from what I said previously, this also will break any
> > existing policies currently controlling TIOCSTI
> > via the selinux ioctl checking in the default case, so at the very
> > least, this would need to be gated by a new
> > SELinux policy capability for compatibility purposes. But I'm still
> > unconvinced that this is the right approach.
> 
> I want to add my voice to the other comments that adding these
> capability checks to the SELinux code and not the main TIOCSTI kernel
> code is not an approach we want to support.  Beyond that, as others
> have already pointed out, I think some additional inspection and
> testing is needed to ensure that the additional capability checks do
> not break existing, valid use cases.

+1 from me as well.

If the perceived problem is in core TTY logic, but the proposed fix is
in SELinux, it only addresses a fraction of the install base, as not
all machines use SELinux.

Also, it's not clear to me why the perceived problem of FD-passsing
with SCM_RIGHTS is a problem at all.  If a CAP_SYS_ADMIN process
accepts FDs over SCM_RIGHTS, it is the responsibility of that process
not to do unjustified privileged operations with these FDs, on behalf
of other, less privileged, processes.

In the more classic attack scenarios (as described in a series of CVEs
[1]) the process who had the FD first is normally the more privileged
one, for for those ones, the existing CAP_SYS_ADMIN check seems fine.

—Günther

[1] https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=TIOCSTI

-- 
