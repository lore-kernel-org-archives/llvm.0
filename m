Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4AF188583
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 20:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887131; cv=none; b=tCKr60YP9hXKlyOvCWLT6UOGV3yEBghNREso8AoA3N8Jc4YtRBkCqOVC5wt2dz6mucg3wg26m/+pOC+359fjdauy7UN2FkVnQc1SnX8/BemfyAphC+A42AlWjC2LaF0dK5o1ZdqrzjZRB84vxCgvpUH5etsFrJW5OcC5ZWFbjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887131; c=relaxed/simple;
	bh=VFHPh8nXdUhf4susFtI38Z36fZi+/qtPeNT0ue5MBzU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oM14MBYB20OXxBClERpYemLFrKZtvS3SJYs0kdst27wfAm2QwwQyJaUPlWrCOBk4/roUpNJicaivFOi1z+ZZw9zZ+p6dR0wYTW8usrJp1PkEsmehYUSsAiuMrPUPkET/Ot8/LMMY9dxySGBVhGqhqv5EM3j2h5uHax65+46BsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=goZlpR2b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goZlpR2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729887128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FcD/VNh69FOcRqnZjL48nNCG151qOe0wHo7rS8ECDQI=;
	b=goZlpR2bdAoeZi2HYgsUwrDvwLFiKLOHDtglJv1t+1IgMS1lE4vzVJriyrquCnhRyyyn8n
	Mm7RsQtWqg4028Nyu+OImw5nn7LguDPN1wXxqFc8JnzCwyCq3z7HoiUmGcKMUCYCjaIDQK
	c0WMZriyUNR1ipvdSaOIglJqF+fMtwY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-WEoEvweNNHSv4p_zbKKIeA-1; Fri,
 25 Oct 2024 16:12:06 -0400
X-MC-Unique: WEoEvweNNHSv4p_zbKKIeA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAD0519560A2
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 20:12:05 +0000 (UTC)
Received: from [172.64.2.86] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5DBB9196BB7D;
	Fri, 25 Oct 2024 20:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc4,
 mainline.kernel.org-clang, c71f8fb4)
Date: Fri, 25 Oct 2024 20:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <75630.124102516120601535@us-mta-147.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.12-rc4-smb3-client-fixes' of git://git.sa=
mba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1512958826

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1512958826-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1512958826-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1512958826-x86_64-kernel-debug


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

