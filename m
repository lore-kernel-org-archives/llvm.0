Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532C1E7C27
	for <llvm@lists.linux.dev>; Sun,  2 Nov 2025 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762046607; cv=none; b=Ogmm3h9XehPw4lXd4aG3g1+4RGCCff9eoOn9Ih/40UE58FFqcpvGorsFeA0GRhcaW9hctQwhWG9O7IrS2GX/hDhAANJXZlDMiTadqBmaLmd6w9FGuGCtk81w+xKksIgXu40GyQJdqoLX0yXDVTzBSq8Mfefk24nYo9Cci3R8T2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762046607; c=relaxed/simple;
	bh=szg6fdgln+iFyZzPzFCc2kw/zN7waXyX80ri6OOUNe0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Sw7uHfhikOCESstrn5/vz8rbeqq0nwxoq/MUtD0iux8T82Y0AYWPiB7g1FdhzSLsxSoQp7Q+JoyRiwF40cJqnotgQ1kUkER8s7xOTaHgbLheiSBn6xz9rgC7wapJdf8yR+j6L7yDd35fnP+FMfvQt7xceRtAiHIBH3sW5woHZJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZA757zQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZA757zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762046603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UAN3p3ea6KCgz8y7ZoZ1WfFGSpZgCJAMdYjEBDF/tqc=;
	b=cZA757zQzSDMPfQVZuMmrgl7QPYXD698roDLL92bxHig1COxkt1PbCQr5UFib5Z/gLSL/4
	XqWjhYVFKZtySM6Mx73udzfC0nCfUJUePOJtrVYv2fRZn5jMTJnlsvoY1KPP4zl9LR1Fny
	w2klzPnRTGwZtaMvZolk/87pKeijQEk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-1Pci9KufPNGmWHKtz25JwA-1; Sat,
 01 Nov 2025 21:22:47 -0400
X-MC-Unique: 1Pci9KufPNGmWHKtz25JwA-1
X-Mimecast-MFC-AGG-ID: 1Pci9KufPNGmWHKtz25JwA_1762046562
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D462519560B0
	for <llvm@lists.linux.dev>; Sun,  2 Nov 2025 01:22:41 +0000 (UTC)
Received: from [172.20.90.15] (unknown [10.30.45.71])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B622180045B;
	Sun,  2 Nov 2025 01:22:40 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0-rc3,
 upstream-mainline, 691d401c)
Date: Sun, 02 Nov 2025 01:22:40 -0000
To: llvm@lists.linux.dev, ftjahjad@redhat.com, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <83052.125110121224700171@us-mta-584.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m6kodNSx0Aub8M18Aokk-rCwSw2ipHiX6T_HnAxCh_U_1762046562
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.18-rc3' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2134664493

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2134664493_x86_64_kernel-debug_kcidb_tool_19905580_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2134664493_x86_64_kernel-debug_kcidb_tool_19905580_10
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
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: BUG: KASAN: slab-use-after-free in nfs_local_call_read
            URL: https://lore.kernel.org/linux-nfs/aPSvi5Yr2lGOh5Jh@dell-pe=
r750-06-vm-07.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

