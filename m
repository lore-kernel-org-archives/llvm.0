Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0158472
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 04:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745037731; cv=none; b=DWdAVQAHVw0egf/Z0LgEeUUsHOqdS4mZ48o1bynuP4g630+lRhdiKXA+A/XFR6WJRWM/BMnTlFbSqDp6m3jMff8eX95sQxbcljthe2PHq1py2/+NxFBLZ9JsT1WP9f8F3oJstoTvpAYOnzrITs2y48Uo18/bMd+HQ98X1D3i/so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745037731; c=relaxed/simple;
	bh=XW4qyqCaqikjlj7BUXUbqgm0smDl1uFsBP6phq+qDUw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=nzas90pmAGWOF7mjMTlTgAJZODLtNlijQUMdsDL+CXTZpukL86YbA6SnZEPq1bDXlGyhKgTC0AGEHe5Spex+RIMF/yW3STmpNVYQ26xP5KAl6f4VCDxXpIXdgPeX2kOn7zJ7Ww+UXrbLCySi2EAhAjuLNx4VsXNNZX+wQI+wveQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuZahPaq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuZahPaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745037728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r30lN2xuQbRbIEPuKojn5WRyAbdgkJjNM+hcvHvQpmc=;
	b=RuZahPaqmR+U1VkEFSCXHdcSPoS8vd1EPG/X3/rUohfM0a0Auir83X++VrusdxCox6gMUB
	y+pPFElxmEyHjzH7A9ApoGJzZaHufVCVgTUXPFm9zmJmuqCwe9Xb5PTL0NE7cG119zoNz1
	nOwMyx4UN+EaMgN5kPt9jDklrGGm+/0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-lTxZtd2LMjOSyffVkLkdnA-1; Sat,
 19 Apr 2025 00:42:05 -0400
X-MC-Unique: lTxZtd2LMjOSyffVkLkdnA-1
X-Mimecast-MFC-AGG-ID: lTxZtd2LMjOSyffVkLkdnA_1745037725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA19C180036D
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 04:42:04 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 366ED1801389;
	Sat, 19 Apr 2025 04:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc2,
 upstream-mainline, 8560697b)
Date: Sat, 19 Apr 2025 04:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <56380.125041900420541219@us-mta-478.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n6-skcE9-Av43T8T957phQiRrmq3s0WYfNTaqB4PXZ4_1745037725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.15-rc2-smb3-client-fixes' of git://git.sam=
ba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1776163671

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1776163671-x86_64-kernel-debug


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

