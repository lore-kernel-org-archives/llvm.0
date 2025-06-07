Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F4BA3D
	for <llvm@lists.linux.dev>; Sat,  7 Jun 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310934; cv=none; b=Bnx/dfGk08EW+bdNgRJJ85BawkSFFYq+SJZKl0/6lPC2dEkja+4YA0rvsg+4EiF72br1M30MQ0UvjDZItSjsa7IUplULW3j3rlB303iuyDC5mPuyv12F/V81pM3jmoFITkcrCoVCmlvYrVxlXrTeJEGeg098WmW4OQd3JPerMco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310934; c=relaxed/simple;
	bh=jyFvv5d2ypci0CgA7w9HytMXTLUByXR2BJ0iRJecWR0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Z17Oz6KsPfQK5CIO53zulwDB05r0dcvsoKQzhtb44R5fnUBiq5CGCGlryz3xd33v0F0Md880fDUCcAJJLlUgv3MrWL0C65HVdR7T+5AFkMoMqMVYZa8VaZW1IRJTfMXdkHinjgWex0vhDqXb+Zo6LBAGrYxgimK1BnEeUGcWhNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKK2/QmF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKK2/QmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749310931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=km47lyU1vthRZrt6oLEIZrQgJSQeZvZQsAMEi0QAPjY=;
	b=KKK2/QmFEcpVfDQA3YdxKZylv+GFYoGCWFaIOLhLUmfKgujLKLuGp3/cdMhyEraylnhJ3j
	/FWm1Y5KeLayeJ7BHWV8djkYu6vO7h+nGWpUZ4w6rbUWlOKW2moD9MxwiPzhbUyv7SzhPM
	hWyzfWUeOdnVxLSnAKhYptisqsVdPzQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-FoaVB48ZMFW9qh0bFnqnzw-1; Sat,
 07 Jun 2025 11:42:08 -0400
X-MC-Unique: FoaVB48ZMFW9qh0bFnqnzw-1
X-Mimecast-MFC-AGG-ID: FoaVB48ZMFW9qh0bFnqnzw_1749310927
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 323881956089
	for <llvm@lists.linux.dev>; Sat,  7 Jun 2025 15:42:07 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A83C330001B7;
	Sat,  7 Jun 2025 15:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 6 of 100): Test report for master
 (6.15.0, upstream-mainline, 7fdaba91)
Date: Sat, 07 Jun 2025 15:42:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <64770.125060711420800388@us-mta-577.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZJo2nBMyLT6UgwlWqomr7YUCeqlIiM_G97GGJ1QfuUo_1749310927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'rtc-6.16' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/abelloni/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1855712889

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

