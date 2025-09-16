Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB483313D66
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050112; cv=none; b=MeVoWWq1giZ/c/DJqn6XfrDI5u67eVKTPG79P5ibYjwdoa9uU/5NeHKrs6AagyexzbweX6/vTz0ct0jYzrO+uGJuV9wx80Nv1GFyPWIidED6KnbC8LSDHJ0G7EYg8LYAWXfOPFw57oYhB29m+vQPuEDKvn/zrOmCOJ+tI0p/og8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050112; c=relaxed/simple;
	bh=S/CA1vmsxYzB+hZsK9J92WGH3qv3ono09AA3FZNzyIU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NwQhk/ondyTu4piESFp4uqNu5Vg/jquo8eC+/wHb60VxooiB1ZzXcEzzWoP4Xmb9sXB/sdP3P6DSnFcFgn5s4vbQMI5oT0UrsIBWbo8EaX+hB+WcGvBEgA73IiIl9sEtp2zqKX0TJle54tKGUNW6lD7B79I7LSLa36DWUKMoDdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUQ14B3U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUQ14B3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w0iQwXRlV6EEvTqPyhjFRt0lecO5z5rFy2Qi9sN8qE0=;
	b=NUQ14B3Uee2yW5J4TZA9YqIk7WodDmMA6gDEvkZMHo+YcEvsWAPP0A+Tv9SgSWyxh20+Gy
	/IhlRQU1aEgvjRq4+toV4nuhq0VdmH2s6FdX1yxLXpEI/2wXtR3T9M/6XGfTIeaHsS1JVO
	5/ZTv9FYWLRN+TumxSabgi0Pa7JDKhE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-CLece9pgOtmEA5x1Cf80fA-1; Tue,
 16 Sep 2025 15:15:08 -0400
X-MC-Unique: CLece9pgOtmEA5x1Cf80fA-1
X-Mimecast-MFC-AGG-ID: CLece9pgOtmEA5x1Cf80fA_1758050107
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD7641800290
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:15:07 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1BAF519560B8;
	Tue, 16 Sep 2025 19:15:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 18 of 137): Test report for master
 (6.17.0-rc1, upstream-mainline, 3a4a0367)
Date: Tue, 16 Sep 2025 19:15:06 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <71817.125091615150800995@us-mta-154.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bnyfJmxH17Bx__nPyJr9BWe0xZ2XnT4AzswXuZYO6K8_1758050107
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'rcu.fixes.6.17' of git://git.kernel.org/pub/=
scm/linux/kernel/git/rcu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1982777945

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1982777945_x86_64_kernel_kcidb_tool_19358967_42
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

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


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x]
    /distribution/command [s390x, x86_64]
    /test/misc/machineinfo [s390x]
    Boot test [s390x]
    CKI/restraint [s390x]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]
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

