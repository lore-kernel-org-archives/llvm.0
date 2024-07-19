Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D806D3C39
	for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721422930; cv=none; b=i0rym6/4HZfiO7cNOwgJCWlM/cEVR82ygn3EFSah3GY+F9I7+EI0hCpkQb/c1Knk3VqZtZcGGqemik8loz+mQwtr14OtFZ8Ju7jad6Vmv7oDk7GQhgnDopyWJ2cqrOe9YWLuXePLxJjR4PcMctceoIqujuA5Ut+P0hSdFXLNXvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721422930; c=relaxed/simple;
	bh=x4JIL0P9X9HqZ06LuIt/264me4NTYWxursr0OM4QLEs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Jj4SDKeu6evGhHszuHZq93PKQRDn0yX6UvSSnkucmYj+3+qBgOPf6WSD88ltUK99FU1j2w4dRyqyUQviBmj9Bo9kCWz9M8SXGxo7fuYe+iVaeXa/7hnOEWDwpHTI+hUvxNOQH8yrA0odHF+blyZ9dnijQHnc3b38Bkth2BLxq1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJt2ljHS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJt2ljHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721422927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oThqL9rNduDZvO4w+WTsNRpsGk4hKQWhww02tYRiatw=;
	b=VJt2ljHSJB3NOllYwx66GVQQjBogTe9ZU3xAOr737IeycSY+YLJLTj2+0kF5k9A/ziY485
	cpOrFSxNaIDcrPdzeOpKoD4uuaYwE/vnHWPIxkaOpaZzHzo5eSEkRTifLjxKPdbT4wX/xS
	xAmNgUvjH9iDfas5/b1v1i8Mf96LPhg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-353-OLjKvezsMFi0SerhHrH9pw-1; Fri,
 19 Jul 2024 17:02:05 -0400
X-MC-Unique: OLjKvezsMFi0SerhHrH9pw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2004B1955D42
	for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 21:02:05 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AC73019560B2;
	Fri, 19 Jul 2024 21:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, a4f92855)
Date: Fri, 19 Jul 2024 21:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <06760.124071917020600205@us-mta-353.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'clk-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1380855509

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1380855509-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1380855509-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1380855509-x86_64-kernel-debug


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

