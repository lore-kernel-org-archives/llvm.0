Received: from c1521c0h.mwprem.net (c1521c0h.mwprem.net [122.17.135.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357D2500CC
	for <llvm@lists.linux.dev>; Mon, 25 Nov 2024 20:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=122.17.135.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732565615; cv=pass; b=S5+5AnaWGnfmxjdrsLn8I0vWt2VjM93Qq2qT5RiiysprO8Umu2KwQf1TYGCwwZ8AuqKJBkqF38nz5tWj8iic3xCLhqAbUjbioq7ULRnlP8IE58PCjggUn+cridKwUPev2ZJGrm38Ns4RJ8bMzn3CFDXlyobJZWjBb6nuAQjvpbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732565615; c=relaxed/simple;
	bh=4NPDwwNBJrqobK34eXVgHRLUUUsimz0Cf3DgCzrS8OA=;
	h=Content-Type:MIME-Version:Subject:To:From:Date:Message-Id; b=RsbX6Lzdm5YPAQqGIWAQDY1QIoPaQuikl0es2ap4GIIgBL3SoWe643ZPLyATrgxN5x/sdTSbGxTJ48MxNER8ZY1WVwekaPmUEmCmQc58C/I0FF7HiDTDKRxXQ7XCrfYyASqWUVDlaXCxKxYAOJTa+0KvXI/bcdpa3cY+5OigXFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=robert-harewood.com; spf=fail smtp.mailfrom=robert-harewood.com; arc=pass smtp.client-ip=122.17.135.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=robert-harewood.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=robert-harewood.com
Received: from [192.168.0.149] (unknown [146.70.201.136])
	by c1521c0h.mwprem.net (Postfix) with ESMTPA id BCF76C4ACDC9
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 05:13:31 +0900 (JST)
Authentication-Results: c1521c0h.mwprem.net; arc=none smtp.remote-ip=146.70.201.136
ARC-Seal: i=1; a=rsa-sha256; d=mwprem.net; s=default; t=1732565612; cv=none;
	b=Arxf77pQ1eD51QvyMzUyO+4CRhE8SOVGsbGAIB4iPl8+zxwzex+Fz8BkXBYkKsn/BT0x9dO1mq8zGJJNqm252l0SYZ7PoRMmv/vDx7WgKAZaHs9q+54wdAdV/5v0gbhCRv1yS/h8E177bho96B6KoPbghuLcEfVfhmpmjbNweG4=
ARC-Message-Signature: i=1; a=rsa-sha256; d=mwprem.net; s=default;
	t=1732565612; c=relaxed/relaxed;
	bh=4NPDwwNBJrqobK34eXVgHRLUUUsimz0Cf3DgCzrS8OA=;
	h=MIME-Version:Subject:To:From:Date:Message-Id; b=vYCgediVXHDSCGhwOrjcY+SGjPA1jvpXbvSId7l90ZGtAt2mH6SYqO/qB7AvnLzOW5Ee6IIchTuEK5oGrk7WVO9j2h/AoIhF6iiEeDYpgx0/hL+Qca/V6EZyYYFuRG5iVFaREMd7LofFhe1wHtLl1q7y9YshKAq56Ev1e/5Qy1U=
ARC-Authentication-Results: i=1; c1521c0h.mwprem.net
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re:
To: llvm@lists.linux.dev
From: "Robert Harewood" <info@robert-harewood.com>
Date: Tue, 26 Nov 2024 04:13:31 +0800
Reply-To: "Robert Harewood" <rh@robert-harewood.com>
Message-Id: <20241125201331.BCF76C4ACDC9@c1521c0h.mwprem.net>

Dear CEO,

I hope this message finds you safe and well.

I have a team of investors who are interested in providing capital to your
business operations and projects without any upfront costs from you. I'd
love to have the chance to discuss the details with you further.

Please let me know if this is something that you would be interested in, and
we can schedule a call to further evaluate the details.

Thank you for your time and consideration.

Warm regards,

Robert Harewood,
Robert Harewood Advisory
The Broadgate Tower
20 Primrose St,
London, United Kingdom, EC2A 2EW.
