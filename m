Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999C23D7D0
	for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761390144; cv=none; b=Hp6sTS92K2xpLtET6Wshsfp5psXsk/eCTzQU9LpfbP77IhHymekArdfOa1D/HSk7vsASZtGxtyfXeZKSTvPbGAGeQ5MT309P2A34LVIVEJX1vG1PWFkFgtN1Yi7Tvi65OExfN0SZhR3rVhznixVr+fo5tFiepRlH4ejoZ5dQDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761390144; c=relaxed/simple;
	bh=wuxpZ6Fg8mYAYfaiLlHS3nkOuWpcyp1C5jofh8qTzGE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=r9sHruYiVLasm8kUFFVPyLaPQSFr5AWoo61MhHJb0TFn2MOoFAh1GdqtZ8uOT04DTcSWPeesT9usSvQhPxpZk9zp6rMmmuOvOo289rHsb0Q3zos7rF3/BS6vnjaPkv3P0JoW9rO59kUSZwH8iJLqoz5jOZeIB23QgQ22PT0/phU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XWogC3a6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XWogC3a6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761390138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mkfc851d4mZVOn3IP7F/cwHKU0INzChmJ7KnqAsLYBY=;
	b=XWogC3a6kTTujDzTbkmrBBNH1NpvPdZt+c/pXsIV6OTuu6rrhMAJcXtXAlchawBUOR9VFt
	RRC/rnbmck1M9LzH+AUb6x6H28WQi+kqHI8LUN0HQqBZBYC+8RMuEnQvx9CvZqPK34TV8R
	hnAryt3YeHH+/DWRq4AfWxmzUaPPqSQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-573-HoNM3kDBPSCpzZ3rddHy3A-1; Sat,
 25 Oct 2025 07:02:14 -0400
X-MC-Unique: HoNM3kDBPSCpzZ3rddHy3A-1
X-Mimecast-MFC-AGG-ID: HoNM3kDBPSCpzZ3rddHy3A_1761390133
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76E3B19540E2
	for <llvm@lists.linux.dev>; Sat, 25 Oct 2025 11:02:13 +0000 (UTC)
Received: from [172.20.84.201] (unknown [10.30.45.119])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 707F830002DB;
	Sat, 25 Oct 2025 11:02:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0-rc2,
 upstream-mainline, 53abe3e1)
Date: Sat, 25 Oct 2025 11:02:12 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <70444.125102507021400865@us-mta-573.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P4M4jcUbqb1xbnSBm1FD8M1VStSg2uk-1QpZ-iXOmhM_1761390133
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: sched: Remove never used code in mm_cid_get()

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2119738161

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2119738161_x86_64_kernel-debug_kcidb_tool_19851718_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2119738161_x86_64_kernel-debug_kcidb_tool_19851718_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

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
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: selinux-policy: serge-testsuite: fatal: unable to access 'ht=
tps://src.fedoraproject.org/tests/selinux.git/': The requested URL returned=
 error: 503
            URL: https://datawarehouse.cki-project.org/kcidb/tests/3565986
            Affected tests:
                selinux-policy: serge-testsuite [x86_64]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

