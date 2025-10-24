Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5430BBB6
	for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298939; cv=none; b=BgcnFi8/XbwWivl4ytj0ycWE2iOupTpIyiXlnDMKOy8zTkiO3ascEr2ndu05RdES6IBlu9F4zYjHT0MkMtsTEQxBS/vAeX0AFx9iZOfzsnKmnsGv87Z+TGHD7awZ3zMQ8/spgmf1ZwotspQS/Rwk3+Zp0JKfgs+D12UmZckckF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298939; c=relaxed/simple;
	bh=aFWmCC6gKlzpGDMvu3PSy5uS0VnxpMoB9XKoBd9vniY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qPdoERVCIGUFYoP2VLDQL+HeShRBkcmHtXdd0K07taYw7hbjGT2rXd0gDo7Kt8MBPIvJeULVAvtP/H0+txg1H3Zoa98k8Hrl/wdxpOreo3n7K0VCmvbyB2SAhKVVWUSntP47R+rFUrUDnGs2RT29o8cqvHT9veQtKFv9zajUsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPhNzgMd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPhNzgMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761298935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v0TeG//Od9xOtYKGap5eg5pkxy7yeVxlJM/MhZysJRI=;
	b=GPhNzgMd6gREsiMhtVm08J0BxtCX59PbQm5kP/tQvl4KOp/B/rnFEFT3L4jMVdY3P+vXUk
	2C7wsycgP0qaHjmwc/GpxQHf5p7qTt7NeKPbQdiCv4ct2w+xIEDLyJzuVrk/Ybfg23lYG6
	15GnzDDnP8HznPn8t2Cp0sgd4hzHBmI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-HGGiSyn5NZ6oR1JBZxZZug-1; Fri,
 24 Oct 2025 05:42:13 -0400
X-MC-Unique: HGGiSyn5NZ6oR1JBZxZZug-1
X-Mimecast-MFC-AGG-ID: HGGiSyn5NZ6oR1JBZxZZug_1761298933
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1884D180136E
	for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 09:42:13 +0000 (UTC)
Received: from [172.20.84.201] (unknown [10.30.45.119])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C6DA19560B8;
	Fri, 24 Oct 2025 09:42:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.18.0-rc2,
 upstream-mainline, 266ee584)
Date: Fri, 24 Oct 2025 09:42:12 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <06490.125102405421300405@us-mta-380.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 75qf5NvfpiuE_-u64LI7WX1DPxb1MNbiw5a1LHyxgEw_1761298933
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
    Commit message: Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2117148100

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
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]



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

