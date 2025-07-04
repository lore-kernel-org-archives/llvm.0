Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417D1E32C3
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610798; cv=none; b=L/L7KK1khooX7OeS9lp2kpR2rBU+k+yTmp0Zv7wSSI45XXlJv0flyPAA3qTpKAcWjT3Mb29F0wxx4D2mpNdvgZ/sE8m9962hG2h95pgOsOqazIbfzT7s1SFAKQM7D7Gc3mdhh0tRtA+FTRVt/fX1AN0hiY5KRb/rNtYigZr9Em0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610798; c=relaxed/simple;
	bh=ts4cRmV5G6pT4KvxSIw0y4r8N+Cbfi9kzIkOC3XomYQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aliw4inYOn6ICWUSHRbVMSKNpjU/JJFpChy70j4VZdxbRpYnMZvN4gYKoj+eMdtw6SquYyjiD2MO+ocJcoKE8F5EG59JxxbD53iC/+VKemvFcOxv+hfE8XMm0wawdO4AXDTXS0NGxqJQf1WXhO++dlcgWcbr/8DxG4AVOd6WLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2sWkFyA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2sWkFyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751610795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WDZyN9gNCpgXiz6PX9T6gkUh/jgcUOvRWpw6+Db+fkk=;
	b=H2sWkFyAOMai3BUlZVn5U2xdzWdtygTHRg4GaI8Vi3pwoBXa3tTgThS1+GMDmwW9Mz+h7e
	ywUxbffsEaWL8kS962BGAyHXM4hrxqTR4xvu088YK55Ya32PZ/sldgVYNMXyUIbY+hoS+8
	2SZAYJOl0p2N0cjRpi8RIqmUluZAnV8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-zBbeL_Y1PJS8ZFVHzhvMww-1; Fri,
 04 Jul 2025 02:33:14 -0400
X-MC-Unique: zBbeL_Y1PJS8ZFVHzhvMww-1
X-Mimecast-MFC-AGG-ID: zBbeL_Y1PJS8ZFVHzhvMww_1751610793
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 389D8180028C
	for <llvm@lists.linux.dev>; Fri,  4 Jul 2025 06:33:13 +0000 (UTC)
Received: from [172.20.236.189] (unknown [10.30.44.207])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AD0713000218;
	Fri,  4 Jul 2025 06:33:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 2 of 100): Test report for master
 (6.16.0-rc4, upstream-mainline, 4c06e63b)
Date: Fri, 04 Jul 2025 06:33:12 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <71475.125070402331400155@us-mta-632.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _w2s5qMjrEXcDFaIGf7K0cv5pA4LvgB1n1itwSPhGv4_1751610793
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
    Commit message: Merge tag 'for-6.16-rc4-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1905528455

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]
        Issue: kernel BUG at kernel/cred.c:104
            URL: https://lore.kernel.org/linux-nfs/20250508051829.bdv2r72l2=
o5rsbni@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]


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

