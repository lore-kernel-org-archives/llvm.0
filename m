Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE961E0B9C
	for <llvm@lists.linux.dev>; Thu,  6 Nov 2025 01:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762391535; cv=none; b=fS9SfpkJnVn1S5DEhFGtcQJr24cJXhpxO03B9YLG0xBs7YGGpWVcbdjQY83XpwnrjELRRRsN2zSMHESNak6wxxXAHeeZghxG9HUI/+nxXLRgJZ02Pc1SKSct+0qGcpQH1GBLgvSAKuOBAHtVjzG05RIl/9qNbDvvPmlr1Zowcrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762391535; c=relaxed/simple;
	bh=bY86xeA8p8EyVQjcjeNihz7+6o/44akVgLKqNvRN4rM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mEu23XEy41vE+jAPs2GOjiBqzoM7M31pew0iRcD7obt06a1mF3asowhLXXCmENC3v/gWfJ1oL9GBMDrCdd80TNT6qBH9sZulCYsiUwbWoBcWLFSHiUsJCC6Lnh/PtNCzzXcRVHgGpL+nfAI3XhCjtUBi74jYamE1fVssaxvWhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XL8mtW70; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XL8mtW70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762391530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AH261aw8Nbki9+CXLF/y6wcPxQb4WFI6ol+xWfQ3dOw=;
	b=XL8mtW700o6gL0Ht5dQ/c6696ys5+GHOA+IcwJ7p9qpuLd0Nk4T8Bs4xlxqhiwbct2H15K
	g2nkMBJr2sghl5XbcV5Xnpl0SrjBudNyMnHYa8fCBmBWHuigpSSlnXaZeM83KKE/7NsgqG
	UDpwQZWl0XoUjzeiYCmPpadrnYJ8vgY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-189-T9_tLicYMtiTyWBFWwUYyg-1; Wed,
 05 Nov 2025 20:12:09 -0500
X-MC-Unique: T9_tLicYMtiTyWBFWwUYyg-1
X-Mimecast-MFC-AGG-ID: T9_tLicYMtiTyWBFWwUYyg_1762391528
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 546F4180034D
	for <llvm@lists.linux.dev>; Thu,  6 Nov 2025 01:12:08 +0000 (UTC)
Received: from [172.20.90.15] (unknown [10.30.45.71])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F156C300018D;
	Thu,  6 Nov 2025 01:12:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 22 of 137): Test report for master
 (6.18.0-rc4, upstream-mainline, 1c353dc8)
Date: Thu, 06 Nov 2025 01:12:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <09566.125110520120900121@us-mta-189.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ica3-teSMSgMtmNJTqRRQRrQ6jKCklxViEf7e4mnBT4_1762391528
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
    Commit message: Merge tag 'media/v6.18-2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/mchehab/linux-media

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2141128279

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
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
                kselftests upstream - net [x86_64, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]
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

