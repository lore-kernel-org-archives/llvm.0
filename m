Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC42224FA
	for <llvm@lists.linux.dev>; Sun,  8 Jun 2025 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749415389; cv=none; b=PISupSvBvC29H+uf454553gWVYrC5weUKKJVhzwCe+2B+XheCgZnvExk2fyfA22PuoViohEwQIwl+iA/vN3F6cf0xmZVijlKXK5eBEaRH3rIxrokWX7D9cSCUfHeE9oSAG/cdZwQFkXOGG56MLhEQes0Y4hpMHeOHmOaQTV1QUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749415389; c=relaxed/simple;
	bh=Emh1jTt24EJAIEkd0Ma2zjtoQ29eY1EMmU/tiYGibfc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EPsWNkYLs+ex2Bki3TDkaWcNU1efV9i8D16LQjAJkc+BD8Ruw6zvSV6Lr8w4uGIky5WEkb7e+ETCWCPcwYHfjotvTa+l56LMPftwYlG/iuE6Z/hsy+2T8pjAtQhp4VIlaPRRKR3gMm5Vw7zd13BBMO2DK7lSfLUa4zOCFJqInyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIkyQMr9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIkyQMr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749415386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8HvluK+Owl7hzZDiVH5DcSF/5/JoG2OJ68cIsTDGkVY=;
	b=VIkyQMr97NhrVm1Zu4wwQLoe3+iAsLHj5VztsMp8kUtFh+9rv7xKnSShkOAQivHAvqaiN0
	6w/BIgt8VzMshGIcSaZoKRYvB2KHWtT6gVvBW5jHEWkM5MnGie2DkWWYb8BI5nPEqagilW
	bNMT9hLT+5DWgMbD14tebwQJzYjIySY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-9mpMjUprP96fCGdQ3WuTQw-1; Sun,
 08 Jun 2025 16:43:05 -0400
X-MC-Unique: 9mpMjUprP96fCGdQ3WuTQw-1
X-Mimecast-MFC-AGG-ID: 9mpMjUprP96fCGdQ3WuTQw_1749415384
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFE401800771
	for <llvm@lists.linux.dev>; Sun,  8 Jun 2025 20:43:04 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5957119560AB;
	Sun,  8 Jun 2025 20:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 12 of 100): Test report for master
 (6.15.0, upstream-mainline, e271ed52)
Date: Sun, 08 Jun 2025 20:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <31710.125060816430500351@us-mta-255.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DFteqwsnRDwtYu70ZaJ8_wVD3wVhV2mb5NsYjzFFBYk_1749415384
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
    Commit message: Merge tag 'pm-6.16-rc1-3' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1855933982

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Boot test [ppc64le]
    CKI/restraint [ppc64le]
    machineinfo [ppc64le]
    Reboot test [ppc64le, x86_64]
    SELinux Custom Module Setup [ppc64le]
    selinux-policy: serge-testsuite [ppc64le]
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

