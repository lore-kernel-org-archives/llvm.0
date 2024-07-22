Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D32F26
	for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721628189; cv=none; b=dsY5jpcucWcoM/1hWkIoh5ubsqusWfAo2JkBSrqkf/2DTRmYEdTpi6yFnknnCcURJY4GImiTTWMKP/7ObCe4IK+4c7MNk3MEgJbauEDvzwVIQebxavwUJnTRAj6i9WY4iL+LJBZATLlJYqkX0GIeV1OussUEp1t0dgd2YbpUX2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721628189; c=relaxed/simple;
	bh=3gRuDsHhKLeQF9i4uQPoCA+iQvuLSvIvIPt1wCRnb78=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fxx1AvcAbWV+fOxP2FU3ZJIKTRfFKdIJmE+G1fJW1NVwkQ8aBE4QpdPU+IU4u0OPmMvSSdEOFLr442jt8fP5h5dWakIaI56Ps+crMYnyKBuVTqyrmZ3auR8ALnwjrqrJUTpbNbuc9nYCFSHBmo1s4uUbiu1eJc3bGnnQ8OOy5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OhSQAgg7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OhSQAgg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721628186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IM+f4VXMMXMoZTWke1agZHZgrqReM2aWRV/T4j/5rd0=;
	b=OhSQAgg7N+o+4+oKqsSksoG2/1LMIiNOIS3EIqHZ06d1QBf2f/uXVvJs8mKN+0hVTsKfWh
	cpw47GftgvHsYqg1DQiuFBnLt2Cj84wlNYzaBuYvkQvPdiDsFf3KhvcFpb0PiSdPYWI3xH
	Vod4lQ4VadGPJjzOMMjKP8q3kHxLTTs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-b0Rj2G19MV6pglhMdSrWMw-1; Mon,
 22 Jul 2024 02:03:04 -0400
X-MC-Unique: b0Rj2G19MV6pglhMdSrWMw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF53C1955D54
	for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 06:03:03 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3315A3000188;
	Mon, 22 Jul 2024 06:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 93306970)
Date: Mon, 22 Jul 2024 06:03:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <41625.124072202030400387@us-mta-385.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.11-rc-smb3-server-fixes' of git://git.samb=
a.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1382301823

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1382301823-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1382301823-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1382301823-x86_64-kernel-debug


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

