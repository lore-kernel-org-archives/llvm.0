Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B501A2389
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050467; cv=none; b=sfPTC69zBQNcLYclfBUZmsb/tk3j2vLRKMu0pt1uVH6P4yLHIw3Gq9AMJ9FnaxEAv9waP29w+cj51larjKX0wzyN3zGZJ28Mi/CCLl1Ywi5pG1I87b1XgA4AsW6n/ipfOR6JyNgAdNS5qWhKDmcoaP/O1w15eQAlhCyi/S3gQ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050467; c=relaxed/simple;
	bh=9MVDkq67aP7sC5dse7j7ntqjQm4tsJq9TEPlBE9ziNs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iyJXFuUozpuh+B4hyNpl2Z76mzAGESqLkfPTHhVKATDO+DxghLuoBcEIB2yVakLExihY2Hw1QYYoGi3FBZI1D7ka56fM8fICrvgcGKU8U0VxasJo5wB+FiuU469x65ggyYgrWVWqZJJZR0mC9zfWoZ8x7fwGqf2yNqXMT1SZf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3CnOyF+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3CnOyF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OuxEa4W/hyzifhArdz/pXAC63Y3wR9iBBjILup/REmk=;
	b=A3CnOyF+2y/aTaBiOg2FQRyN5+ERqFESRxvGoG8iu6AGpKCIxjJRZIyy0h3VSadGAu6+TB
	FQge1kwp0Rb7KBTsEvXVNSP1D1j9E0vN+JAYon3t4USoz7VDI9MW/a7DBFArRZySek4PeS
	kAK/rb3mwGVjxyVz/gpHP6IzoJ7Mkb4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-6Eyr0U1tNQmiDUqaWSb9DQ-1; Tue,
 16 Sep 2025 15:21:01 -0400
X-MC-Unique: 6Eyr0U1tNQmiDUqaWSb9DQ-1
X-Mimecast-MFC-AGG-ID: 6Eyr0U1tNQmiDUqaWSb9DQ_1758050461
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1518F19560A2
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:21:01 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F2231800452;
	Tue, 16 Sep 2025 19:21:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.16.0-0,
 upstream-mainline, 831462ff)
Date: Tue, 16 Sep 2025 19:21:00 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <14170.125091615210103637@us-mta-56.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qVtqtVYxO4Xx7TaDSyA5Nqr0E2Xif3Xkj81GjuNjsTY_1758050461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'leds-next-6.17' of git://git.kernel.org/pub/=
scm/linux/kernel/git/lee/leds

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1960058927

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1960058927_aarch64_kernel_kcidb_tool_19262292_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1960058927_aarch64_kernel_kcidb_tool_19262292_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1960058927_x86_64_kernel_kcidb_tool_19262302_33
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1960058927_x86_64_kernel-debug_kcidb_tool_19264744_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

