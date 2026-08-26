Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F24483BE;
	Wed, 26 Aug 2026 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768756; cv=none; b=GN/EUQtQZMG6k+AwYrIAywoooyKB0dcA5clIVQ20b2113wHBsZrbmuMr9s2sDCG7K88IHWxACpkL93M78EfVaGEm0YfehbTy4gRmCobOOW6+hM+kDkq/RF1obc73j54n7cPjEZtyT3dnd/nWD/PaivHq5aNcYPYiiC0GvCOuf1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768756; c=relaxed/simple;
	bh=TWwFd8FrNgqu+VvQXVmisOxfsnZfKYfjtN+0io9ZQkM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=czRqPIj0YCJCQ/R5PN7tXEVWM9Pv5+8mE5NMEQmDpKK1G2yjF4w3KerR6z+CEdNjQONSMt6KvZ68jhu3vHlsxBiMfO8XAvVgjAdPSLoI4/OrD2vt5xq9lA3zyrPIuhB02XNDa8M2H7u8cXpzKAGSIKOD5gLq+cRHXxRKQG5SxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUYLTL8y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUYLTL8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641AC1F000E9;
	Wed, 26 Aug 2026 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787768739;
	bh=kLn6AvI4c60Oz33g0cy0RB20x/1O7VB73bVynaozi/A=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=NUYLTL8yAKO5oaOkQSvW4Q/D7NSUg2ieTJel6bLhX4kxdhThw0w9/eUuD+FdcsJYl
	 mWJIGSnPN0bmrkxreqC4b8qRtBtWgemB4Td69wSD21s14otaaXfP1TnHGMK2dpQI+G
	 ws3scBrSVCqk9UzHnb9b4J2Q76pFQJTnBSSQBkablSZy2hS+qn2Agi31zhuXLG9/u4
	 Wf7V6/qT4OSfAD4xHgpcADgpNGS6Arztk9EQi2F1+SnL45tSq5tMslpoDvT1HfORp5
	 eIdSTBz1tkGdGASNE8DqV5dDSpWTI3BA7NMckVwi2afh0UugflPTcfoEYaeizgziO5
	 29ggBljwGTyGQ==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:25:33 +0200
Message-Id: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
Cc: <linux-usb@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt"
 <justinstitt@google.com>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, <gregkh@linuxfoundation.org>, <oneukum@suse.com>,
 <stern@rowland.harvard.edu>
To: "Mike Lothian" <mike@fireburn.co.uk>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a
 bulk-endpoint driver
References: <20260826163101.4168-1-mike@fireburn.co.uk>
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>

(Cc: Greg, Oliver, Alan)

On Wed Aug 26, 2026 at 6:30 PM CEST, Mike Lothian wrote:
>   v2 10/11, "keep usb::Device private and gate ...", is dropped entirely.
>     Oliver Neukum was right that it was conceptually wrong: USB does devi=
ce
>     level operations, and hiding that behind an interface is a layering
>     violation. Device stays public

On an abstract level a USB interface is a device that is operated by some
driver, which is why from a driver core topology point of view, a struct
usb_interface *is* a struct device. And there is no layering violation in
shortening:

	intf.device().bulk_send();

to

	intf.bulk_send();

Now, I get that this might read a bit odd from a pure USB topology perspect=
ive,
but what this shortcut gives you is that it allows you to not create types =
with
incorrect type states intermediately.

If USB folks really want the API to have an indirection, so it matches the =
USB
topology reading a bit better, just create an abstract a new type, e.g.:

	struct IoDevice<'a> {
	    intf: &'a usb::Interface<Bound>,
	}

which only provides the corresponding I/O methods, but does not give you ac=
cess
to a "real" usb::Device<Bound>. This way you can still write:

	intf.device().bulk_send();

if that's preferrable.

Interestingly, looking at your series, it already does something like this,=
 but
it's called IoWindow and oddly reimplements the lifecycle constraints the R=
ust
driver core infrastructure already provides.

> Alan Stern's lifecycle point is what makes device access from an interfac=
e
> sound, and is worth restating because the whole shape depends on it: an
> unconfigured device has no interfaces, so an interface that exists implie=
s a
> configured device

Well, Alan also said this:

"At first I thought that we ought to have such a guarantee.  But in fact we
don't, because the user can at any time write to a USB device's
bConfigurationValue sysfs attribute even if the device isn't bound to a dri=
ver.
This can create interfaces which may then be bound to drivers."

This was a reply to me asking:

"So, what you're saying is that, in the generic case, there is a guarantee =
that
if a usb_interface is bound to a usb_driver, then the usb_interface's paren=
t
usb_device is also bound to a usb_device_driver."
