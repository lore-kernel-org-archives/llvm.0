Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E93D3CEE
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035992; cv=none; b=VqkwZ5LdgX5rIrQwwvn4QY9NgXtLBfh7flWo5ffQO4FbAtKZ2eLj6ivgoRfSair/rzoL/8VVcV+DLvvcsWihPtLwHzDEmr60zauY41MwBMoXnUl15d9bWNDKHEZLrdr8bdh2cFLrygvTuhiyAh8oLLLaNfCoZ/l5Ljt+w060xrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035992; c=relaxed/simple;
	bh=MFtg1emUeucLC5RSIu21nxOCG0W4wmfv4xYsj8/jrxI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=osYSfUWBsdy1lXp16ERTyERA4gCXQEB6lpbUvt6p3fv3RA9GcA2jfhvoqX9CDT/SGyJSPsNpA2DZgLvtlJQbXTDTrpH+oRMEB6G5dNgyQLriJSsniRmLjGeD+lj7PJW/PiiRPId5sIhBHB+GqEeG8vq2vGfE1vB+rOIq0M0K64g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jxag5y7e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jxag5y7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775035988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tZilAT3NsSDS/f+5vp1KifA4Baeqktax6PWPnWoNfFA=;
	b=Jxag5y7e/nXeJdLB4OiQltHp8NbCOg/LJLgAnM1lhhwo5LYcktxmkXTZ3DGqwg2Va6ecfh
	d+Dwt8ejyYt5BHjrBOuvFn7HnogSQvZfxtPema/hOZg3K/J/gtI03F6qzn3n5Qxv5vMEzK
	f+tUtY0OgD9zsySX2yCz8z2Y+8vFSY4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-o3-HYU26MnOx8mbms30Aqg-1; Wed,
 01 Apr 2026 05:33:06 -0400
X-MC-Unique: o3-HYU26MnOx8mbms30Aqg-1
X-Mimecast-MFC-AGG-ID: o3-HYU26MnOx8mbms30Aqg_1775035986
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E63A11800281
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 09:33:05 +0000 (UTC)
Received: from [172.20.201.103] (unknown [10.30.44.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82D0C180075B;
	Wed,  1 Apr 2026 09:33:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc6,
 upstream-mainline, 9147566d)
Date: Wed, 01 Apr 2026 09:33:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <01901.126040105330601212@us-mta-583.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i7HnwZwR1bjW8bhWeE8B_khkLO2-JoxAxyfpN14GOFk_1775035986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'sched_ext-for-7.0-rc6-fixes' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2422041829

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2422041829_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
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

