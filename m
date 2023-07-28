Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802501FAF
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:53:24 +0000 (UTC)
Received: from [192.168.1.166] ([91.218.190.200])
	by cmgsmtp with ESMTPSA
	id PHGuqQdvWPm6CPHGwqknNL; Fri, 28 Jul 2023 08:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1690526903; bh=wNCr6ECi53A9+aj5+69BlskR7OtUltgiHZXVfwsSghI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=Pd7E5VNjX8JQvOheV+6el81wzHB2N8eG1Yy2csQGd0pAzeHa932zd692MSL0jlcol
	 EgXW9WCRcnR+6t5uErQcyOIt3yfh8+Ks3JT865pZMZzz3rNAf8a6OibuD/JYILecBO
	 l/XQ/i3XHR1YtFTycUxnZPqGPlxDe4D0pOqpcb4bpXIiALD2ORcDa1p3boEZPFCnVM
	 9WNSjpfia1zVdXTc4K6kLbq9W4RQiQqY9MqRZ7a3aNem2gHYkZI/GHXDXkmORMz18S
	 6xfhMMgDmoBg8/J9Lk20RzY+KpmuF+60ICxNLyYQmcJ+EEugaLoDdx6U90fiprRDKi
	 reNDwNgrFjQUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1690526903; bh=wNCr6ECi53A9+aj5+69BlskR7OtUltgiHZXVfwsSghI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=Pd7E5VNjX8JQvOheV+6el81wzHB2N8eG1Yy2csQGd0pAzeHa932zd692MSL0jlcol
	 EgXW9WCRcnR+6t5uErQcyOIt3yfh8+Ks3JT865pZMZzz3rNAf8a6OibuD/JYILecBO
	 l/XQ/i3XHR1YtFTycUxnZPqGPlxDe4D0pOqpcb4bpXIiALD2ORcDa1p3boEZPFCnVM
	 9WNSjpfia1zVdXTc4K6kLbq9W4RQiQqY9MqRZ7a3aNem2gHYkZI/GHXDXkmORMz18S
	 6xfhMMgDmoBg8/J9Lk20RzY+KpmuF+60ICxNLyYQmcJ+EEugaLoDdx6U90fiprRDKi
	 reNDwNgrFjQUg==
Message-ID: <fbceb8e5444eab23788501b002926e07f54fdd7c.camel@triops.cz>
Subject: Re: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
From: Ladislav Michl <ladis@triops.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel test robot
	 <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-usb@vger.kernel.org
Date: Fri, 28 Jul 2023 08:48:20 +0200
In-Reply-To: <2023072653-viewable-harmonics-09e0@gregkh>
References: <202307260537.MROrhVNM-lkp@intel.com>
	 <2023072653-viewable-harmonics-09e0@gregkh>
Organization: Triops, s.r.o.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJEvISPn+xE8iYqJouYIpnSQ0RL60IieVgfhbgeJFAK0k0hQ2zMHO713m3FaJ9QegWffSg17lbVogstW6+U1LwFfuBxvHB7dA1S2FPstwxQcSFCL3/E9
 s0AfghZhOEly6UCdf/m+9QsDBBe3frppc4hbKcyWi8LB2VMGSgmCdfPLzfu9gjiMHG+h3aOEt34kxLXQsFqtIC3PbtlMHSDWitNACcZAmxBeJTxoWpPpRzPG
 n2s6wXVxoCwAUubis4oUWX1TVyiLEZ/x4M5LIfwzTvibpbScfkqUIF36LE+sQYUo5ym4JuHsYTzCRMP7d9ZiyQ==

Hi Greg,

I'm sorry for late reply (travelling)

On Wed, 2023-07-26 at 06:39 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 26, 2023 at 05:09:56AM +0800, kernel test robot wrote:
> > Hi Ladislav,
> >=20
> > First bad commit (maybe !=3D root cause):
> >=20
> > tree:=C2=A0=C2=A0
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git=C2=A0usb=
-
> > testing
> > head:=C2=A0=C2=A0 ac47051f0bb8ccf1eaedb296a19fcb541474db53
> > commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb: dwc3:
> > dwc3-octeon: Convert to glue driver
>=20
> Ladislav, I've dropped your dwc3-octeon patches from my tree now,
> please fix up and resend when you have this resolved.

As I didn't find a better place to ask, I'm asking here:
all registers are 64bit and driver is now using GENMASK and BIT
macros to access their values. Reported problem comes from 32bit
configuration, where BIT is UL(1) << (nr) and BITS_PER_LONG is 32.
Is using GENMASK_ULL and BIT_ULL preferred way to go here? I'm not a
bit fan of "fixing" code just to silence warning on irrelevant
configurations, but will do it unless someone points me to better way.

Thank you,
	l.
