Received: from mail.hotelshavens.com (mail.hotelshavens.com [217.156.64.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9A12AAC6
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.156.64.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813929; cv=none; b=INs76dm2PgDEnA43KMXrwOSxPge1dmKgJa7WNsU1bGcf/OyB/k7X5W1DJ12BQKXlA6VOoARtcfZYbVnGwkp0h4xPahhMvp+H1rFvVaLqme7MS7BhgXJhLXqGePqL1HPA3F3whKuKY1YUcnENWtf5OCHcUazIPn1cg4yISSD22iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813929; c=relaxed/simple;
	bh=JF0sDr3q6/xiGGghKq46xR0eW0nazP+VzvHupEO9Q58=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M+i+if8yiSUktZLW6MehRrKYYX20aYdqVz0f+d9ROPImIb9pSq4h1ohaxkCIm0sumtW3TJckwXK3/P/goCgr4KprKO+WfeYVL8o8GFigP8dXg6hShXuhbxa2uefGx1V88SruIPq5lgi4zhSdP8PojFUIQM6ibZkeMhFVvJbz7/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotelshavens.com; spf=pass smtp.mailfrom=hotelshavens.com; dkim=pass (4096-bit key) header.d=hotelshavens.com header.i=admin@hotelshavens.com header.b=Jj2NSZHS; arc=none smtp.client-ip=217.156.64.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotelshavens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotelshavens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=hotelshavens.com header.i=admin@hotelshavens.com header.b="Jj2NSZHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=hotelshavens.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=admin@hotelshavens.com;
 bh=JF0sDr3q6/xiGGghKq46xR0eW0nazP+VzvHupEO9Q58=;
 b=Jj2NSZHSEB5RvZG4mjvskndIBZv7fHUbd6IRJjR6J/QyKglBrL/FQafB5ENV1Q/VzabjQaruG+5O
   WMchpDeJv8zMaWa4t83PSBxiNFx9JiivMv+g/gbRcxXpION05TC+Cq8N/ON2RtdgBfu3pO8W0cES
   FYbydikF2SkWcO4XgOUIsKwqFCMrqzL8ePpytrK3dXOTMO/M0dhVEJiydZ51S0vqLAczAmVcVX9c
   nmx/NrRdIcf2WTvNSs7bk4G986F7b9NtWk95U8p1a23vNC+Qa7WPY3ScF2d5IjODsxkOJCBnzXHF
   kLhGDF/IeFcq9zqEwBC5b67kzQyEWPol3yHjjjsTd7cJsCQoIS23bQ+FJJnpLL5CbCpZNbOIOIAO
   zHclNvHbJbEwQW/uy4P5GLaivqdCjc/biHSXGTW55OZdMzAqmXWoDKEuiHD/reZrpoUEjbwwthfH
   SmqNDGXCwjfbouS8V4qq6Mz53pUjsq096J8UP72amXSYv84oROwRCe4Bq3gBKgJAzVFwjW5JMwt1
   nnStioN4xQYQHPpQdR1ByPoHO1iB3OOrMHerEv6w7g3QYHRCaAsp2KCsdA5rElBm7EYUpSiu9goj
   mrdBBVBUmhCpXyVgQUWggAkOej8tnf/LdL7IlwCKnNCimnllkUPcwIcAOrUN6dMlxHJxBgW85LQ=
Reply-To: boris@undpkh.com
From: Boris Soroka <admin@hotelshavens.com>
To: llvm@lists.linux.dev
Subject: HI DEAR !
Date: 16 Aug 2024 15:15:31 +0200
Message-ID: <20240816134828.499EC76BCD4148F8@hotelshavens.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

Did you receive my last email message I sent to this Email=20
address: ( llvm@lists.linux.dev ) concerning relocating my=20
investment to your country due to the on going war in my country=20
Russia.

Best Regards,
Mr.Boris Soroka.
