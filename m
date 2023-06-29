Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D7125C3
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 15:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8BCC433C8;
	Thu, 29 Jun 2023 15:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688053014;
	bh=kSpwvCZSrV4ZbYU3Q5FvpCaAemmPCQQhwe8ZxmoemxI=;
	h=Date:From:To:Cc:Subject:From;
	b=KVC28lW5yxngXLh5CccM8D8GYCbNrX2qHUHcnIIazRGP+JOx0zBuezE5LJR1VYZUD
	 h5XRSfxiyXKlFyLAge4GsKqyWVi4IZtqkqV/Xfsxap2UKkUdYmcIdEs3QR0Y0qGNwr
	 8PyTNSfEyEyrAh0Zwitxg0LlDGXYaXbrxejHBWLU=
Date: Thu, 29 Jun 2023 17:36:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>, linux-usb@vger.kernel.org
Subject: UBSAN spat in valid xhci code in Linus's current tree (6.4+)
Message-ID: <2023062945-fencing-pebble-0411@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees.

Boris just reported to me a UBSAN splat in the USB xhci driver in
Linus's tree that wasn't present in 6.4-final, and given that no USB
changes are merged yet there, I was confused.

Turns out, I think you all missed a "variable length" structure in the
xhci driver, which UBSAN is calling out a being an overrun, when really
it isn't (it's just written that way...)

The splat is:

UBSAN: array-index-out-of-bounds in drivers/usb/host/xhci-hub.c:231:31
index 1 is out of range for type '__le32 [1]'
CPU: 0 PID: 1556 Comm: kworker/0:2 Not tainted 6.4.0+ #7


And yes, the code there:
	ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);

is accessing the ssp_cap->bmSublinkSpeedAttr field with is declared as:
	_le32 bmSublinkSpeedAttr[1]; /* list of sublink speed attrib entries */

in include/uapi/linux/usb/ch9.h

So perhaps 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC") should be
reverted for now?  Or this field fixed up to properly be marked as a
variable length array of at least one entry?

thanks,

greg k-h

