Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B60A18AEA
	for <llvm@lists.linux.dev>; Sun,  1 Dec 2024 21:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733089989; cv=none; b=k1G3GnuEST42XdtVcfkM9zH9X7Jbo9vnw3tBtr0Kqi1sFPItKxlefZnwUwrTP0CA0VZ5aeh7fYWtYot6KABeXnrm7YU8nR+C1DARvtOY49BUQRgILgcsY2UZnwYD3uQzOloBvYDntBMNIF+x76aLV7gRqQj0CHvZDrtBM5r5Buw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733089989; c=relaxed/simple;
	bh=/FVnn6namqYwp2pEaHcO2PgiBiqsPHm8St4sUpVRyOQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Qpo9QXOPsSvw/DgdMNaTv4ErP1PFy3wIEfheG3//yo+YwsZr5qNgzQYkVQavswNQssatKwCzkjMrdf+4z3AfpGkXISfeWtAqW9JKmNGWCDCaIabJNmMftikSZ15cgbFfsI30iJif19gMcrBvs6TS+tz4L4E+7AwU0oSoEC0gTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOVdNjwx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOVdNjwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733089986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sRePiuo7TqevrMp6xmyhMHS5Ne0iD0ya4ptyEvEskGk=;
	b=QOVdNjwxpcL0sxRSmT31qmW8IL9loA6wo7uBd4yKBVOhL0aG2u3Ex5cx+kPnSYZQ7gWa6G
	p/MTdGy0wfUAz6ljVNhFryZzssJXRp22nETnGNFrTC17w6fVhhTTXmwDGNYWsFFgRr8eUd
	g6SQXHQjnDG63c9TkWd+iuawFKHaqlQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-SbguqepuNryW1yx1E_QkhQ-1; Sun,
 01 Dec 2024 16:53:05 -0500
X-MC-Unique: SbguqepuNryW1yx1E_QkhQ-1
X-Mimecast-MFC-AGG-ID: SbguqepuNryW1yx1E_QkhQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63BC019560A7
	for <llvm@lists.linux.dev>; Sun,  1 Dec 2024 21:53:04 +0000 (UTC)
Received: from [172.64.12.14] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 106A71956052;
	Sun,  1 Dec 2024 21:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, f788b5ef)
Date: Sun, 01 Dec 2024 21:53:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <86742.124120116530500456@us-mta-665.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HR11e36eTD_ib1VF4g5wCTT4jysOyL74AywmRv_b7gY_1733089984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'timers_urgent_for_v6.13_rc1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1568186640

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1568186640-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1568186640-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1568186640-x86_64-kernel-debug


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

