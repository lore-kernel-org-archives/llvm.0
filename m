Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200933ADBA
	for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998533; cv=none; b=HzdONWr18T1bzwubt1E6eM9OzkcHJ833NOPfHk9gLVULePCBl+AQda08FTogopWJgrUeof//a6/7FlWXer3zV0FmSblEvaYkd3xOkJeGzElxqnE8ghSm6yc/MdFN0Ycx6Szqlzi0j4YAGGR8IuJynn0+9cwqSCllqyAo6HfEt4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998533; c=relaxed/simple;
	bh=PhQXZKtba7ITXXpMxqDE13jAjK5XuCJA33kvRYoraPk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kjAgBxb1gujN38sYjW6PRyC8VjJMc1eLXm6O37PzgomrAM6mCwQA9wjCnBZSfGNFZ7g05EcRuTuIlavHyf5M1ilDS9gPkrAOvlX6Thuy9Z8KLrPhkadanuopLIJ7066q3xm2RaJniCf7fAvax3oq/Viyz4Fu9kaqgPVSD3PuNsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vnmw0j92; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vnmw0j92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773998531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=11oCAh5vfYa3zrS42RKn2lcdfFOzB9v1mLT9aJ6CWOY=;
	b=Vnmw0j92FYiLrLYkbXJmMLUjjCU21d7zKESHQaEMTx9GQWGWLc0Rmw3jl1h76DEUf1RczY
	D56Jc1tyK5GFCtSzHf/p+gMntJH7CntUjrYxuFaLmyrmoYJCN9WfuVDVgYEUJNFBTtAM+U
	lYKQ0aXGvy6nFl5rR7zo3N+eJMZ78Ag=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-5hOIF0pVOBa62z9lRZWVSA-1; Fri,
 20 Mar 2026 05:22:07 -0400
X-MC-Unique: 5hOIF0pVOBa62z9lRZWVSA-1
X-Mimecast-MFC-AGG-ID: 5hOIF0pVOBa62z9lRZWVSA_1773998527
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3D251944E43
	for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 09:22:06 +0000 (UTC)
Received: from [172.20.92.244] (unknown [10.30.44.31])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1DD29180075D;
	Fri, 20 Mar 2026 09:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc4,
 upstream-mainline, a1d9d8e8)
Date: Fri, 20 Mar 2026 09:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <34559.126032005220700534@us-mta-613.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zpoTr2KJoCc5PVrfeHFpKQnQEkW_O9WIZPDvlSyp-x4_1773998527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'net-7.0-rc5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2396720022

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2396720022_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
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

