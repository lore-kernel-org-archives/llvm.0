Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EC30B524
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764981790; cv=none; b=hAtLm87WbxP7QH91/TCcSjfz5n5KsPT1vOKbfaw6w2yEViBM31Hfngv8rOiyJ5e8Mvr7q7PF+XXW7hNOhtOV+ns3J/deKpQLYZy8F0PlbcVhj2/9ylezdQxTQ2MN3PIrrIEFKRBuLhh6mtwXrcsCASdxbfswx/sQtHjdq7zICmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764981790; c=relaxed/simple;
	bh=qg05+M1dlL+s3hGPlCkq6zkEsz9ca+hCA+Y49yFfSYM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=h/OSyQ/XNJU1q1hhpMwcgf6zIISmoQwqMj9s2qdtytAWhZx8KdkS0tZaIzVV5CxVjgX/vERU/kJ3H6x1OrfBO4TD8OFcGSOJyXmRx/+IH7eXvXIVQqU27NIrr8QuMVwTlbZg7UYDI1Hvm5hI9A1v9vYgvUQY2dAzaYRhnnIoX4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZEvGSlLH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZEvGSlLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764981787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WLBQ+FcP8VCpp5vcPhdE11djdk1D7cv78EsZpmUhtn0=;
	b=ZEvGSlLH15THRDy0zF5e7f35L/MWtBYzvhA7ZuRV5EuLlWobVW3CHY1cfxNAztrSUq4/EN
	pzyjBp5kginD2MDjqMe63AA1Aq9xJ3SMWaBc/ZuebNPoYKClBDHsggH+CUGW8wueh0qm3h
	CmBpFOp6s6YIdukhnU02vpvLGiY5RbA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-iy5Rja--Pp2s3tEX3Kl5lg-1; Fri,
 05 Dec 2025 19:43:05 -0500
X-MC-Unique: iy5Rja--Pp2s3tEX3Kl5lg-1
X-Mimecast-MFC-AGG-ID: iy5Rja--Pp2s3tEX3Kl5lg_1764981785
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13449195609F
	for <llvm@lists.linux.dev>; Sat,  6 Dec 2025 00:43:05 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D6733011A86;
	Sat,  6 Dec 2025 00:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, 7203ca41)
Date: Sat, 06 Dec 2025 00:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <49826.125120519430600177@us-mta-153.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8GrKGN-a3-fRGfClHmdY4Hj6vqEQAyyp8YlKOd8-Hqg_1764981785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-stable-2025-12-03-21-26' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2199241939

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2199241939_x86_64_kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

