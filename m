Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082821518F
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229334; cv=none; b=pco7HF+dOWVT3Z/fy8hRfVAk+/1cSch31eezB8eOsxwjp27o10WRZN7xdLHVQXG1pE0aQO5qrnctazXIpWS8QQVkhQ7aUvcJE0ZXDb46TA4KgeBJfaTiueh+8qOTL/ie6SIsNgCszT50PXT06re+tOSyz40HN51Bu7X33rLy6hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229334; c=relaxed/simple;
	bh=CgLt7VXd7UHMmetfBNhIXWvLi+gA+sv5eHk8+3yEdSE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ea5Y3O24+OfpufxMm6K9JfYgE+tUgyRdlN6ADMbUF4QzntaLqCqCrkP2IlDX+fzqXLaue/GZ9R+59tE7q0VtO2MSiz4ERczpKzSqtbw6JYzAV5F66AA03noLfBvm6wtMN8dR+lqv+Z+CDikCMs+L4vwSVy1H5kXWmAXJR/22DM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZjBiew0f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZjBiew0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746229329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DyqNWPnLiKClducMIZCEtiqfm88gxha8KyVzb7cZK6I=;
	b=ZjBiew0f8RYeoZ9klx5gfq/YqllPTfK/AXYK9NL0vFnn0StB0IwuFLoYY9IJhHmlXM0/Hh
	TWNv8+2XFr4RLhts09GkUOt10moNECNYPyiBVn1Sd54z7rkjvmHdf9a9MYdmPdM0BjfPH3
	MHa76wdVk5/RmRpkzrSh8IPH48418ss=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168--QQ_gmcEOBef04YSrvBSiw-1; Fri,
 02 May 2025 19:42:08 -0400
X-MC-Unique: -QQ_gmcEOBef04YSrvBSiw-1
X-Mimecast-MFC-AGG-ID: -QQ_gmcEOBef04YSrvBSiw_1746229326
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 522AA1955DCC
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 23:42:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B3E7719560A3;
	Fri,  2 May 2025 23:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, b6a218ff)
Date: Fri, 02 May 2025 23:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <26508.125050219420800159@us-mta-168.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6rguLql-sxycUzBSXqdarw45aUr1cfd0E4lZ-9iC4vY_1746229326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pm-6.15-rc5' of git://git.kernel.org/pub/scm=
/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1798107237

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1798107237-x86_64-kernel-debug


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

