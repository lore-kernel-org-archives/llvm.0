Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267502F1FFE
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717130; cv=none; b=pTQAVcTN5ejsYP+4w38Rjw9PV0BhnqewjqjwO0OVpUsubAao5kF9ZUX28/e5IJ1AIxMECW12K3Y3J2J1WhArIC0E/v0ebPTx0+yDVC2DiLH3O1ot6k7gzrlgeheM+C0dhfkgjiwAQGzmbfFhng+yR8K6LRTt0gDHOroNnfQ+5Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717130; c=relaxed/simple;
	bh=4R8tQhfDsZe5XSLGYX+cV1PyPrS6My1oObzMMBc8MMo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BVrlQbckqh+TndwI7WsgDmfzzxCqRPt5T6FaM2ETmWwMXtvvEY9Ww7qDKUiVKAqktHKF+H62DXYppB3f9bKFFC4uJXtkTgu2xeN1ezBX/BTprUp4otW+1OuydidA0k0AFvAqFBKW6MSvHmXgntUXVBd3F9coFRMFY+WtghI5g28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PNwUQEs/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PNwUQEs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764717127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3zcQcWDgtGk0OlCTPdIJEfhTzqXiK7qndIj/JFWjA10=;
	b=PNwUQEs/bD1he0urRn7P8IH3yeXhzeFugxbJcvwQ5JwDHNoxNhTTPfnPBLcK3miuQDxZTX
	dP/JR4dtWQt9ElGgRFbPIvdxPPIHsqIgmelYwSUYsYKftohUTCH5wmwPUSPksnsDAv6Oj+
	4Athk2SYvtFSUzjlWd/srlAIhOZNRzQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-v9qLVIR9NHysN6YBwe6nuQ-1; Tue,
 02 Dec 2025 18:12:06 -0500
X-MC-Unique: v9qLVIR9NHysN6YBwe6nuQ-1
X-Mimecast-MFC-AGG-ID: v9qLVIR9NHysN6YBwe6nuQ_1764717125
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B0C818001D1
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 23:12:05 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 144981800451;
	Tue,  2 Dec 2025 23:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, d7489818)
Date: Tue, 02 Dec 2025 23:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <67482.125120218120600653@us-mta-119.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DNb40422Jf4AXCwq1COZFk4Uf_fPjnX6rP4MdF3n8FY_1764717125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_cleanups_for_v6.19_rc1' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2192308555

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2192308555_x86_64_kernel-debug


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

