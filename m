Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B2823BCFD
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050080; cv=none; b=pr90+bTLVk9Kql+F9WjMIcUKKzaxnek+1AtpokgRRUp9OzVge7g6jH2LDpfPbokEIlOymQJoyEatALGTk3hKNZqRIRDzbID1g1/WGeg34iaLAeBKAe8R+lUsuMaAXwT6X+qbT1a/uMxkGteAZg5LSrBXCdL2zthqALXSHh9ZtSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050080; c=relaxed/simple;
	bh=RLTtYkO3/+IvbQjyQEAaEApdBUJhxHRroOBNLqtXSzk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=D18UScn5ueZxk6w8pvqkiV5BVIiqtni0iEQyT7h0g+OGJE6EKeYupevq0dT/rc5SfAUkX45C6AvI05JOi7FxaqYZFxATjwETIEiKrYlATH28FdR6RaKhyXVJANSg5uIHYUlP06tGdxD43j4/wnnZpHnJdu8Myq0Vl3xZU/fPi9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TgTHV4m7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TgTHV4m7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4k0UFhagQOgfX+JaN6vydDu2fryA6fX0VyTRphH5BvE=;
	b=TgTHV4m7WNODtio1Bdo0OT4isMEJjAOX7MrDflQhrH6pt12xkm4fO5AGiqNHAqV2rkcQMM
	4mSHpVkAhV07eaYpkhivh5bD1s2Q5h27/T4S993zvMVq/KomWk26B9UozOjm5Fzm2+Uk2L
	eS8s1jw5FfucyUfeDSiTBqakbvehMjE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-d-mkph7sOVyYLwmCXkZTFQ-1; Tue,
 16 Sep 2025 15:14:36 -0400
X-MC-Unique: d-mkph7sOVyYLwmCXkZTFQ-1
X-Mimecast-MFC-AGG-ID: d-mkph7sOVyYLwmCXkZTFQ_1758050075
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFD55195608B
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:14:35 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88CD919560B8;
	Tue, 16 Sep 2025 19:14:35 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 18 of 137): Test report for master
 (6.17.0-rc1, upstream-mainline, 24ea63ea)
Date: Tue, 16 Sep 2025 19:14:35 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <13784.125091615143603048@us-mta-564.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SuUmScnmEu4E6yNLt0hpzd6fiTV1SVnLj-AqppTMM-w_1758050075
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'acpi-6.17-rc2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1984816918

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1984816918_x86_64_kernel_kcidb_tool_19366372_31
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

